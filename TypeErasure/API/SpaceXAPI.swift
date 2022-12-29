//
//  LaunchesAPI.swift
//  TypeErasure
//
//  Created by Michal Stembera on 26.12.2022.
//

import Foundation


protocol SpaceXAPI {
    func launches() -> LaunchesEndpoint
    func capsules() -> CapsulesEndpoint
}

class SimpleSpaceXAPI: SpaceXAPI {
    func launches() -> LaunchesEndpoint {
        LaunchesEndpoint()
    }

    func capsules() -> CapsulesEndpoint {
        CapsulesEndpoint()
    }

}
