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
    
    let thumbnail = Image(systemName: "music.mic")
    let gradient: LinearGradient = {
        let colors: [Color] = [.orange, .pink, .purple, .red, .yellow]
        return LinearGradient(gradient: Gradient(colors: [colors.randomElement()!, colors.randomElement()!]), startPoint: .center, endPoint: .topTrailing)
    }()
}

var musicPlaylist = [
    Track(title: "Take it Easy", artist: "Geo", duration: "2:48"),
    Track(title: "All Black", artist: "SubZero", duration: "3:30"),
    Track(title: "Break Me Down", artist: "P", duration: "2:40"),
    Track(title: "I Believe", artist: "SubZero", duration: "3:26"),
    Track(title: "No Reason", artist: "P", duration: "3:07"),
    Track(title: "No Big Deal", artist: "SubZero", duration: "2:50"),
    Track(title: "Slowly", artist: "P", duration: "1:51")
]

