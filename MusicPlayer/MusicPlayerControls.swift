//
//  MusicPlayerControls.swift
//  MusicPlayer
//
//  Created by George Taylor on 6/8/23.
//

import SwiftUI
import ComposableArchitecture

struct MusicPlayerControlsView: View {
    let track: Track
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.gray)
                .opacity(0.2)
                .frame(width: 80, height: 5, alignment: .center)
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
                }
                Spacer()
                MusicPlayerControls(track: track, store: StoreOf<MusicPlayerControlsReducer>(initialState: MusicPlayerControlsReducer.State(currentTrack: "", nextTrack: ""), reducer: {
                    MusicPlayerControlsReducer()
                }))
            }
        }.padding(.horizontal)
    }
}

struct MusicPlayerControls: View {
    let track: Track
    let store: StoreOf<MusicPlayerControlsReducer>
    var body: some View {
        WithViewStore(self.store) { viewStore in
            HStack(spacing: 10) {
                Button {
                    // Play/Pause Song
                    viewStore.send(.playTrack(track: track))
                } label: {
                    Image(systemName: "pause.fill")
                }
                Button {
                    // Next Song
                    viewStore.send(.nextTrack(track: track))
                } label: {
                    Image(systemName: "forward.fill")
                }
            }
        }
    }
}

struct MusicPlayerControls_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerControlsView(track: Track(title: "Test Song", artist: "Test Artist", duration: "2:13"))
    }
}
