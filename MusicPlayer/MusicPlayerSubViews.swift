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
                        ForEach(viewStore.state.favoritedSongs, id: \.self) { artist in
                            FeaturedArtist(artist: artist, store: StoreOf<FavoriteArtistFeatureReducer>(initialState: FavoriteArtistFeatureReducer.State(listOfSongs: []), reducer: {
                                FavoriteArtistFeatureReducer()
                            }))
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

//struct MusicPlayerView: View {
//    var body: some View {
//        TrackRow(track: <#T##Track#>)
//    }
//}

struct TrackRow: View {
    //    let store: StoreOf<FavoriteArtistFeatureReducer>
    @State var selectedTrack: Track?
    var body: some View {
        //        var currentTrack: Track? = nil
        //        WithViewStore(self.store) { viewStore in
        VStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.gray)
                    .shadow(radius: 15)
                Image("SCNTD")
                    .resizable()
                    .scaledToFit()
            }
            .frame(height: 180)
            .padding(.horizontal)
            
            ScrollView(.vertical) {
                VStack {
                    //            for track in musicPlaylist {
                    ForEach(musicPlaylist) { track in
                        HStack {
                            track.thumbnail
                                .padding()
                                .background(track.gradient)
                                .cornerRadius(6)
                            VStack(alignment: .leading) {
                                Text(track.title)
                                Text(track.artist)
                                    .foregroundColor(.secondary)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                            }.onTapGesture {
                                selectedTrack = track
                            }
                            Spacer()
                            
                            Text("\(track.duration)")
                            FavoriteButtonView(track: track, store: StoreOf<FavoriteArtistFeatureReducer>(initialState: FavoriteArtistFeatureReducer.State(listOfSongs: []), reducer: {
                                FavoriteArtistFeatureReducer()
                            }))
                        }
                    }
                }.padding(.horizontal)
            }
        }
        if selectedTrack != nil {
            Spacer()
            MusicPlayerControlsView(track: selectedTrack ?? Track(title: "--", artist: "--", duration: "-:-"))
        }
    }
}

struct FeaturedArtist: View {
    let artist: String
    let store: StoreOf<FavoriteArtistFeatureReducer>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
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
}


//struct MusicPlayerSubViews_Previews: PreviewProvider {
//    static var previews: some View {
//        //        FeaturedArtistsList(artists: ["Sub-Zero", "P", "Geo"])
//        TrackRow(musicPlaylist: <#T##MusicPlaylist#>, store: <#T##StoreOf<FavoriteArtistFeatureReducer>#>)
//    }
//}
