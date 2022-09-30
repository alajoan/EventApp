//
//  ApiRouter.swift
//  EventApp
//
//  Created by user228425 on 9/24/22.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {
    
    case checkIn(identifier: String, eventId: Int, email: String)
    case eventList
    case download(url: String)
    
    private var method: HTTPMethod {
        switch self {
        case .checkIn:
            return .post
        default:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .checkIn:
            return "checkin"
        case .eventList:
            return "events"
        case.download:
            return ""
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .checkIn(let identifier, let eventId, let email):
            return [
                Constants.Parameters.identifier : identifier,
                Constants.Parameters.eventId : eventId,
                Constants.Parameters.email : email
            ]
        default:
            return [:]
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        
        var urlRequest: URLRequest
        
        switch self {
        case .download(let url):
            urlRequest = URLRequest(url: try url.asURL())
        default:
            urlRequest = URLRequest(url: try Constants.baseUrl.asURL().appendingPathComponent(path))
        }
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.acceptType.rawValue)
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}
