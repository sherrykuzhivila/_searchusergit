//
//  Environment.swift
//  gitHUBBBBB
//
//  Created by Admin on 16/03/23.
//

import Foundation
public enum Enviornment {
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Info.plist not found")
        }
        return dict
    }()
    
    static let baseUrl: String = "https://api.github.com"
    static let imageBaseUrl: String = {
        guard let imageBaseUrl = Enviornment.infoDictionary["IMAGE_BASE_URL"] as? String else {
            fatalError("IMAGE_BASE_URL not found in Info.plist")
        }
        return imageBaseUrl
    }()
}
