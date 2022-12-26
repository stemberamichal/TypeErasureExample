//
//  CapsulesEndpoint.swift
//  TypeErasure
//
//  Created by Michal Stembera on 26.12.2022.
//

import Foundation

struct Capsule: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "capsule_id"
        case type
        case status
    }

    let id: String
    let type: String
    let status: String
}

struct CapsulesEndpoint: APIEndpoint, URLProvider {
    typealias Output = [Capsule]

    let url = URL(string: "https://api.spacexdata.com/v3/capsules?limit=5&offset=0")!
}
