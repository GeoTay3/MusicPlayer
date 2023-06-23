//
//  FavoriteArtistFeatureReducer.swift
//  MusicPlayer
//
//  Created by George Taylor on 5/22/23.
//

import Foundation
import ComposableArchitecture

struct FavoriteArtistFeatureReducer: ReducerProtocol {
    
    struct State: Equatable {
        var listOfSongs: [String]
        var favoritedSongs: [String] = []
    }
    
    enum Action: Equatable {
        static func == (lhs: FavoriteArtistFeatureReducer.Action, rhs: FavoriteArtistFeatureReducer.Action) -> Bool {
        return true
        }
        
        case favorited(track: Track)
        case unfavorited(track: Track)
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .favorited(let track):
            state.favoritedSongs.append(track.title)
        case .unfavorited(let track):
            state.favoritedSongs = state.favoritedSongs.filter(){$0 != track.title}
        }
        return .none
    }
}
