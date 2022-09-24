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
    static func getEventList() -> Observable<[EventList]> {
        return request(ApiRouter.eventList)
    }
    
    private static func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        return Observable<T>.create { observer in
            
            let request = AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
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
