//
//  LaunchesAPI.swift
//  TypeErasure
//
//  Created by Michal Stembera on 26.12.2022.
//

import Foundation

protocol SpaceXAPI {
    func launches() -> AnyEndpoint<[Launch]>
    func capsules() -> AnyEndpoint<[Capsule]>
}

class SimpleSpaceXAPI: SpaceXAPI {
    func launches() -> AnyEndpoint<[Launch]> {
        AnyEndpoint(endpoint: LaunchesEndpoint())
    }

    func capsules() -> AnyEndpoint<[Capsule]> {
        AnyEndpoint(endpoint: CapsulesEndpoint())
    }
}
