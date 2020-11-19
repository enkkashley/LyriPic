//
//  TrackLyriPicCards.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 18/11/2020.
//

import SwiftUI

struct TrackLyriPicCards: View {
    
    @ObservedObject var lyricsViewModel = LyricsViewModel()
    
    var track: Track
    
    init(_ track: Track) {
        self.track = track
        lyricsViewModel.getLyricsAndSlice(from: track)
    }
    
    var body: some View {
        
        if lyricsViewModel.isLoading {
            ProgressView()
        } else {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 20) {
                    ForEach(lyricsViewModel.lyriPicCards) { lyriPicCard in
                        LyriPicCardView(lyriPic: lyriPicCard)
                    }
                }
                .padding(20)
            }
            .navigationTitle(track.track.trackName)
        }
    }
}

//struct TrackLyriPicCards_Previews: PreviewProvider {
//    static var previews: some View {
//        TrackLyriPicCards()
//    }
//}
