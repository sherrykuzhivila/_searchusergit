//
//  QuantumValue.swift
//
//  Created by MAC on 31/08/22.
//

import Foundation
enum QuantumValue: Codable {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .int(let x):
            try container.encode(x)
        case .bool(let x):
            try container.encode(x)
        case .double(let x):
            try container.encode(x)
        }
    }
    
    
    case int(Int), string(String), bool(Bool), double(Double)
    
    init(from decoder: Decoder) throws {
        if let int = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(int)
            return
        }
        
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        
        if let bool = try? decoder.singleValueContainer().decode(Bool.self) {
            self = .bool(bool)
            return
        }
        
        if let double = try? decoder.singleValueContainer().decode(Double.self) {
            self = .double(double)
            return
        }
        throw QuantumError.missingValue
    }
    
    enum QuantumError:Error {
        case missingValue
    }
}

extension QuantumValue {
    
    var intValue: Int? {
        switch self {
        case .int(let value): return value
        case .string(let value): return Int(value)
        case .bool(let value): return (value ? 1 : 0)
        case .double(let value): return Int(value)
        }
    }
    
    var stringValue: String? {
        switch self {
        case .int(let value): return String(value)
        case .string(let value): return value
        case .bool(let value): return (value ? "1" : "0")
        case .double(let value): return String(value)
        }
    }
    
    var boolValue: Bool? {
        switch self {
        case .int(let value): return (value == 1)
        case .string(let value): return (value == "1")
        case .bool(let value): return value
        case .double(let value): return (value == 1)
        }
    }
}
