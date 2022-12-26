//
//  APIEndpoint.swift
//  TypeErasure
//
//  Created by Michal Stembera on 26.12.2022.
//

import Foundation

protocol APIEndpoint {
    associatedtype Output

    func load() async throws -> Output
}

protocol URLProvider {
    var url: URL { get }
}

extension APIEndpoint where Self: URLProvider, Output: Decodable {
    func load() async throws -> Output {
        let request = URLRequest(url: self.url)
        let task = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Output.self, from: task.0)
    }
}
