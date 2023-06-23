//
//  FavoriteButtonView.swift
//  MusicPlayer
//
//  Created by George Taylor on 5/22/23.
//

import SwiftUI
import ComposableArchitecture

struct FavoriteButtonView: View {
    let track: Track
    let store: StoreOf<FavoriteArtistFeatureReducer>
//    @State private var isFavoriteArtist: Bool = false
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Button {
                    if viewStore.favoritedSongs.contains(track.title) {
                        viewStore.send(.unfavorited(track: track))
                        print("remove from favorited")
                    } else {
                        viewStore.send(.favorited(track: track))
                        print("added to favorited")
                    }
                } label: {
                    if viewStore.favoritedSongs.contains(track.title) {
                        Image(systemName: "heart.fill")
                    } else {
                        Image(systemName: "heart")
                    }
                }
                
            }
        }
    }
}

struct FavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        //        FavoriteButtonView()
        EmptyView()
    }
}
