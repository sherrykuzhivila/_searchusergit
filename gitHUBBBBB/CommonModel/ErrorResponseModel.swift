//
//  ErrorResponseModel.swift
//
//  Created by MAC on 31/08/22.
//

import Foundation

struct ErrorResponseModel : Codable {
    
    let message : String?
    let statusCode : QuantumValue?
    let status : QuantumValue?
    let success :  QuantumValue?
    let successCode :  QuantumValue?
    let code :  QuantumValue?
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case statusCode = "statusCode"
        case success = "success"
        case successCode = "successCode"
        case code = "code"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        statusCode = try values.decodeIfPresent(QuantumValue.self, forKey: .statusCode)
        success = try values.decodeIfPresent(QuantumValue.self, forKey: .success)
        successCode = try values.decodeIfPresent(QuantumValue.self, forKey: .successCode)
        code = try values.decodeIfPresent(QuantumValue.self, forKey: .code)
        status = try values.decodeIfPresent(QuantumValue.self, forKey: .status)
    }
    
}
