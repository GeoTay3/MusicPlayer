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
        var listOfArtists: [String]
        var favoritedArtists: [String] = []
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
            state.favoritedArtists.append(track.artist)
        case .unfavorited(let track):
            state.favoritedArtists = state.favoritedArtists.filter(){$0 != track.artist}
        }
        return .none
    }
}
