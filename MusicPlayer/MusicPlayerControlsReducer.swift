//
//  MusicPlayerControlsReducer.swift
//  MusicPlayer
//
//  Created by George Taylor on 6/23/23.
//

import Foundation
import ComposableArchitecture

struct MusicPlayerControlsReducer: ReducerProtocol {
    
    struct State: Equatable {
        static func == (lhs: MusicPlayerControlsReducer.State, rhs: MusicPlayerControlsReducer.State) -> Bool {
            return true
        }
        
        var currentTrack: String
        var nextTrack: String
    }
    
    enum Action: Equatable {
        static func == (lhs: MusicPlayerControlsReducer.Action, rhs: MusicPlayerControlsReducer.Action) -> Bool {
        return true
        }
        
        case nextTrack(track: Track)
        case playTrack(track: Track)
        case pauseTrack(track: Track)
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .nextTrack(track: let track):
//            state.prevTrack = track.title
            // Go to next Track
            track.id
        case .playTrack(track: let track):
            state.currentTrack = track.title
            // Play the song
        case .pauseTrack(track: let track):
            state.currentTrack = track.title
            // Pause the song
        }
        return .none
    }
}
