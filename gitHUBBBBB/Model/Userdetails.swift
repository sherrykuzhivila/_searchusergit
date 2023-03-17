//
//  Userdetails.swift
//  gitHUBBBBB
//
//  Created by Admin on 17/03/23.
//
import Foundation
struct Userdetails : Codable {
    let login : String?
    let avatar_url : String?
    let followers_url : String?
    let name : String?
    let location : String?
    let public_repos : Int?
    let public_gists : Int?
    let followers : Int?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case login = "login"
        case avatar_url = "avatar_url"
        case followers_url = "followers_url"
        case name = "name"
        case location = "location"
        case public_repos = "public_repos"
        case public_gists = "public_gists"
        case followers = "followers"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        login = try values.decodeIfPresent(String.self, forKey: .login)
        avatar_url = try values.decodeIfPresent(String.self, forKey: .avatar_url)
        followers_url = try values.decodeIfPresent(String.self, forKey: .followers_url)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        public_repos = try values.decodeIfPresent(Int.self, forKey: .public_repos)
        public_gists = try values.decodeIfPresent(Int.self, forKey: .public_gists)
        followers = try values.decodeIfPresent(Int.self, forKey: .followers)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
