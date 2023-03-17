//
//  NetworkConstants.swift
//  gitHUBBBBB
//
//  Created by Admin on 17/03/23.
//

import Foundation
struct NetworkConstants {
    /// The keys for HTTP header fields
    enum HTTPHeaderFieldKey: String {
        case authorization = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case token = "token"
        case ApiKey = "Api-Key"
        
    }
    
    /// The values for HTTP header fields
    enum HTTPHeaderFieldValue: String {
        case json = "application/json"
        case formData = "multipart/form-data"
    }
}
enum NetworkMessages: String {
    // Auth
    case common = "We are not able to perform this request – please check that you are connected to the internet and retry. Thank you."
    case internetIssue = "You are not connected to internet"
    case badRequest = "Bad API request"
    case unauthorized = "Unauthorized"
}

enum Result<data, error> {
    case sucess(data)
    case failure(error)
}
