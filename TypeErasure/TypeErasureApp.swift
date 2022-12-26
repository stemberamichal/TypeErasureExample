//
//  TypeErasureApp.swift
//  TypeErasure
//
//  Created by Michal Stembera on 26.12.2022.
//

import SwiftUI

@main
struct TypeErasureApp: App {
    private let spaceXAPI: SpaceXAPI = SimpleSpaceXAPI()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel(spaceXAPI: self.spaceXAPI))
        }
    }
}
