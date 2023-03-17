//
//  ArrayResponseModel.swift
//
//  Created by mac on 17/10/22.
//

import Foundation
struct ArrayResponseModel<Data:Codable>: Codable {
    
    let statusCode : Int?
    let total : Int?
    let message : String?
    let data : [Data]?
    
    enum CodingKeys: String, CodingKey {
        
        case statusCode = "statusCode"
        case total = "total"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
    }
    
}

