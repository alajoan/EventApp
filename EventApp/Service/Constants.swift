//
//  Constants.swift
//  EventApp
//
//  Created by user228425 on 9/24/22.
//

import Foundation

struct Constants {
    static let baseUrl = "http://5f5a8f24d44d640016169133.mockapi.io/api/"
    
    struct Parameters {
        static let identifier = "identifier"
        static let eventId = "eventId"
        static let email = "email"
    }
    
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    enum ContentType: String {
            case json = "application/json"
    }
    
    enum ApiError : Error {
        case forbidden
        case notFound
        case conflict
        case internalServerError
    }
}
