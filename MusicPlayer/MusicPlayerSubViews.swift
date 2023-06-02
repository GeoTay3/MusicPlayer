//
//  MusicPlayerSubViews.swift
//  MusicPlayer
//
//  Created by George Taylor on 3/15/23.
//

import SwiftUI
import ComposableArchitecture

struct FeaturedArtistsList: View {
    //    let artists: [String]
    let store: StoreOf<FavoriteArtistFeatureReducer>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            
            VStack(alignment: .leading) {
                Text("Featured Cats")
                    .font(.title)
                    .padding(.leading)
                
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 25.0) {
                        ForEach(viewStore.state.favoritedArtists, id: \.self) { artist in
                            FeaturedArtist(artist: artist)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct TrackRow: View {
    let music: MusicPlaylist
    let store: StoreOf<FavoriteArtistFeatureReducer>
    
    
    var body: some View {
        //        WithViewStore(self.store) { viewStore in
        HStack {
//            for track in musicPlaylist.musicPlaylist {
                ForEach(music.musicPlaylist, id: \.self) { track in
                    
                track.thumbnail
                    .padding()
                    .background(track.gradient)
                    .cornerRadius(6)
                
                Text(track.title)
                Text(track.artist)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                Spacer()
                
                Text("\(track.duration)")
                FavoriteButtonView(store: StoreOf(initialState: FavoriteArtistFeatureReducer.State(listOfArtists: track.artist), reducer: {
                    FavoriteArtistFeatureReducer()
                }))
            }
        }.padding(.horizontal)
        //                }
    }
}

struct FeaturedArtist: View {
    let artist: String
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill([Color.orange, .pink, .purple, .red, .yellow].randomElement()!)
                    .scaledToFit()
                
                Image(systemName: "music.mic")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
            }
            
            Text(artist)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .frame(width: 120)
        //        .padding(4)
    }
}


//struct MusicPlayerSubViews_Previews: PreviewProvider {
//    static var previews: some View {
//        //        FeaturedArtistsList(artists: ["Sub-Zero", "P", "Geo"])
//        TrackRow(musicPlaylist: <#T##MusicPlaylist#>, store: <#T##StoreOf<FavoriteArtistFeatureReducer>#>)
//    }
//}
