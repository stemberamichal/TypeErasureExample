//
//  LaunchesAPI.swift
//  TypeErasure
//
//  Created by Michal Stembera on 26.12.2022.
//

import Foundation

protocol SpaceXAPI {
    func launches() -> any APIEndpoint<[Launch]>
    func capsules() -> any APIEndpoint<[Capsule]>
}

class SimpleSpaceXAPI: SpaceXAPI {
    func launches() -> any APIEndpoint<[Launch]> {
        LaunchesEndpoint()
    }

    func capsules() -> any APIEndpoint<[Capsule]> {
        CapsulesEndpoint()
    }
}

class AnotherSpaceXAPI: SpaceXAPI {
    let _launches: any APIEndpoint<[Launch]>
    let _capsules: any APIEndpoint<[Capsule]>

    init(
        launches: some APIEndpoint<[Launch]>,
        capsules: some APIEndpoint<[Capsule]>
    ) {
        self._launches = launches
        self._capsules = capsules
    }

    func launches() -> any APIEndpoint<[Launch]> {
        self._launches
    }

    func capsules() -> any APIEndpoint<[Capsule]> {
        self._capsules
    }
}
