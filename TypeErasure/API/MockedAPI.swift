//
//  MockedAPI.swift
//  TypeErasure
//
//  Created by Michal Stembera on 26.12.2022.
//

import Foundation

struct MockedEndpoint<Output>: APIEndpoint {
    private let value: Output

    init(value: Output) {
        self.value = value
    }

    func load() async throws -> Output {
        return self.value
    }
}

class MockSpaceXAPI: SpaceXAPI {
    func launches() -> any APIEndpoint<[Launch]> {
        MockedEndpoint(value: [])
    }

    func capsules() -> any APIEndpoint<[Capsule]> {
        MockedEndpoint(value: [])
    }
}
