//
//  MusicPlaylist.swift
//  MusicPlayer
//
//  Created by George Taylor on 3/15/23.
//

import SwiftUI

struct Track: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let duration: String
    
    let thumbnail = Image(systemName: "heart")
    let gradient: LinearGradient = {
        let colors: [Color] = [.orange, .pink, .purple, .red, .yellow]
        return LinearGradient(gradient: Gradient(colors: [colors.randomElement()!, colors.randomElement()!]), startPoint: .center, endPoint: .topTrailing)
    }()
}


struct MusicPlaylist {
let musicPlaylist: [Track] =
[Track(title: "Take it Easy", artist: "Geo", duration: "2:48"),
 Track(title: "Song 1", artist: "Artist 2", duration: "3:15")]


}
