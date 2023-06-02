//
//  FavoriteButtonView.swift
//  MusicPlayer
//
//  Created by George Taylor on 5/22/23.
//

import SwiftUI
import ComposableArchitecture

struct FavoriteButtonView: View {
    let store: StoreOf<FavoriteArtistFeatureReducer>
    @State private var isFavoriteArtist: Bool = false
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Button {
                    viewStore.send(.favorited(track: <#T##Track#>))
                } label: {
                    Image(systemName: "heart")
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
