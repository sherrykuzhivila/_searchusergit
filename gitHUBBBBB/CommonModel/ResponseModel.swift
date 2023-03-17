//
//  ResponseModel.swift
//  gitHUBBBBB
//
//  Created by Admin on 17/03/23.
//

import Foundation
struct ResponseModel<Data:Codable>: Codable {
    
    let data : Data?
    let message : String?
    let statusCode : QuantumValue?
    let accessToken : String?
    let profile : Data?
    let settings : Data?
    let total  : Int?
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case message = "message"
        case statusCode = "statusCode"
        case accessToken = "access_token"
        case profile = "profile"
        case settings = "settings"
        case total = "total"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(Data.self, forKey: .data)
        profile = try values.decodeIfPresent(Data.self, forKey: .profile)
        settings = try values.decodeIfPresent(Data.self, forKey: .settings)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        statusCode = try values.decodeIfPresent(QuantumValue.self, forKey: .statusCode)
        accessToken = try values.decodeIfPresent(String.self, forKey: .accessToken)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
    }
    
}
