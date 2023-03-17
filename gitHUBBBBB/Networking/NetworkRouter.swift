//
//  NetworkRouter.swift
//  RGSeed
//
//  Created by MAC on 31/08/22.
//

import Foundation
import Alamofire

enum NetworkRouter: URLRequestConvertible {
    
    // MARK: routes

    case userdetails(username : String)
    
    // MARK: path
    private var path: String {
        switch self {
        case.userdetails(let username):
            return "/users/\(username)"
        }
    }
    
    // MARK: method
    private var method: HTTPMethod {
        switch self {
        case .userdetails:
            return .get
            
        }
    }
    
    // MARK: body
    private var body: Parameters? {
        switch self {
        default:
            return nil
        }
    }
    
    // MARK: queryParameters
    private var queryParameters: Parameters? {
        switch self {
        case.userdetails(let username):
            return["username":username]
        default:
            return nil
        }
    }
    var shouldCache: Bool {
        switch self {
        default:
            return false
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var url = try Enviornment.baseUrl.asURL()
        
        
        // Append path
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // Determine HTTP method
        urlRequest.httpMethod = method.rawValue
        
        // Set common headers
        urlRequest.setValue(NetworkConstants.HTTPHeaderFieldValue.json.rawValue,
                            forHTTPHeaderField: NetworkConstants.HTTPHeaderFieldKey.acceptType.rawValue)
        urlRequest.setValue(NetworkConstants.HTTPHeaderFieldValue.json.rawValue,
                            forHTTPHeaderField: NetworkConstants.HTTPHeaderFieldKey.contentType.rawValue)
        
//        if let accessToken = accessToken {
//            urlRequest.setValue(accessToken,
//                                forHTTPHeaderField: NetworkConstants.HTTPHeaderFieldKey.authorization.rawValue)
//        }
        
        // Add http body to request
        if let body = body {
            do {
                let data = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                urlRequest.httpBody = data
                
            } catch (_) {
                
            }
        }
        
        // Add query parameters to request
        if let parameters = queryParameters {
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
    
}
