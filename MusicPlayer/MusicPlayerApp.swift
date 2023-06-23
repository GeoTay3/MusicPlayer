//
//  MusicPlayerApp.swift
//  MusicPlayer
//
//  Created by George Taylor on 3/15/23.
//

import SwiftUI
import ComposableArchitecture


@main
struct MusicPlayerApp: App {
    var body: some Scene {
        WindowGroup {
            TrackRow()
        }
    }
}
