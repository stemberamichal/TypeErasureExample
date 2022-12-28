//
//  LaunchesAPI.swift
//  TypeErasure
//
//  Created by Michal Stembera on 26.12.2022.
//

import Foundation

protocol SpaceXAPI {
    func launches() -> any APIEndpoint
    func capsules() -> any APIEndpoint
}

class SimpleSpaceXAPI: SpaceXAPI {
    func launches() -> any APIEndpoint {
        LaunchesEndpoint()
    }

    func capsules() -> any APIEndpoint {
        CapsulesEndpoint()
    }
}
