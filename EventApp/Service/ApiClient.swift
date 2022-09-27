//
//  ApiClient.swift
//  EventApp
//
//  Created by user228425 on 9/24/22.
//

import Foundation
import RxSwift
import Alamofire

class ApiClient {
        
    static func getEventList() -> Observable<[Event]> {
        return request(ApiRouter.eventList)
    }
    
    static func checkinUser(identifier: String, eventId: Int) -> Observable<Bool> {
        return request(ApiRouter.checkIn(identifier: identifier, eventId: eventId))
    }
    
    static func getImage(url: String) -> Observable<UIImage> {
        return downloadImage(ApiRouter.download(url: url))
    }
    
    private static func downloadImage(_ urlConvertible: URLRequestConvertible) -> Observable<UIImage> {
        return Observable<UIImage>.create { observer in
            let request = AF.request(urlConvertible).response { response in
                switch response.result {
                case .success(let imageData):
                    guard
                        let image = imageData,
                        let tempImage = UIImage(data: image, scale: 1)
                    else { return }
                    
                    observer.onNext(tempImage)
                    observer.onCompleted()
                case .failure(let error):
                    switch response.response?.statusCode {
                    case 403:
                        observer.onError(Constants.ApiError.forbidden)
                    case 404:
                        observer.onError(Constants.ApiError.notFound)
                    case 409:
                        observer.onError(Constants.ApiError.conflict)
                    case 500:
                        observer.onError(Constants.ApiError.internalServerError)
                    default:
                        observer.onError(error)
                    }
                }
                
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    private static func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = AF.request(urlConvertible).responseDecodable(of: T.self) { (response: AFDataResponse<T>) in		
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    switch response.response?.statusCode {
                    case 403:
                        observer.onError(Constants.ApiError.forbidden)
                    case 404:
                        observer.onError(Constants.ApiError.notFound)
                    case 409:
                        observer.onError(Constants.ApiError.conflict)
                    case 500:
                        observer.onError(Constants.ApiError.internalServerError)
                    default:
                        observer.onError(error)
                    }
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
