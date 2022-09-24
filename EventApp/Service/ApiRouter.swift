//
//  ApiRouter.swift
//  EventApp
//
//  Created by user228425 on 9/24/22.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {
    
    case checkIn(identifier: String, eventId: Int)
    case eventList
    
    private var method: HTTPMethod {
        switch self {
        case .checkIn:
            return .post
        case .eventList:
            return .get
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
        default:
            return "events"
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .checkIn(let identifier, let eventId):
            return [
                Constants.Parameters.identifier : identifier,
                Constants.Parameters.eventId : eventId
            ]
        case .eventList:
            return [:]
        default:
            return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.asURL()
              
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
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
