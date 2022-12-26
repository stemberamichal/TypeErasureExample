//
//  LaunchesAPI.swift
//  TypeErasure
//
//  Created by Michal Stembera on 26.12.2022.
//

import Foundation


protocol SpaceXAPI {
    var launches: LaunchesEndpoint { get }
    var capsules: CapsulesEndpoint { get }
}

class SimpleSpaceXAPI: SpaceXAPI {
    let launches = LaunchesEndpoint()
    let capsules = CapsulesEndpoint()
}
