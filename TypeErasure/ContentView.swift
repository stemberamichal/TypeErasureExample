//
//  ContentView.swift
//  TypeErasure
//
//  Created by Michal Stembera on 26.12.2022.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    private let spaceXAPI: SpaceXAPI

    @Published private(set) var launches: [Launch] = []
    @Published private(set) var capsules: [Capsule] = []

    init(spaceXAPI: SpaceXAPI) {
        self.spaceXAPI = spaceXAPI
    }

    func load() {
        Task {
            let launches = try await self.spaceXAPI.launches().load()
            let capsules = try await self.spaceXAPI.capsules().load()
            DispatchQueue.main.async {
                self.launches = launches as? [Launch] ?? []
                self.capsules = capsules as? [Capsule] ?? []
            }
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel

    var body: some View {
        VStack {
            ForEach(
                self.viewModel.launches,
                id: \.flightNumber
            ) { launch in
                Text("Launch: \(launch.missionName)")
            }
            ForEach(
                self.viewModel.capsules,
                id: \.id
            ) { capsule in
                Text("Capsule: \(capsule.type)")
            }
        }
        .padding(10)
        .onAppear(perform: self.viewModel.load)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            viewModel: ContentViewModel(spaceXAPI: SimpleSpaceXAPI())
        )
    }
}
