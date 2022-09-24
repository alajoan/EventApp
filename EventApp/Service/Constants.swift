//
//  Constants.swift
//  EventApp
//
//  Created by user228425 on 9/24/22.
//

import Foundation

struct Constants {
    static let baseUrl = ""
    
    struct Parameters {
        static let identifier = "identifier"
        static let eventId = "eventId"
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
