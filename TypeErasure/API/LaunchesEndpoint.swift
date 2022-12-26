//
//  LaunchesEndpoint.swift
//  TypeErasure
//
//  Created by Michal Stembera on 26.12.2022.
//

import Foundation

struct Launch: Decodable {
    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case launchYear = "launch_year"
    }

    let flightNumber: Int
    let missionName: String
    let launchYear: String
}

struct LaunchesEndpoint: APIEndpoint, URLProvider {
    typealias Output = [Launch]

    let url: URL = URL(string: "https://api.spacexdata.com/v3/launches?limit=5&offset=0")!
}
