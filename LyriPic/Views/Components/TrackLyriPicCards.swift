//
//  TrackLyriPicCards.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 18/11/2020.
//

import SwiftUI

struct TrackLyriPicCards: View {

    @ObservedObject var lyricsViewModel = LyricsViewModel()
    
    init(_ track: Track) {
        lyricsViewModel.getLyricsAndSlice(from: track)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(lyricsViewModel.lyriPicCards) { lyriPicCard in
                    LyriPicCardView(lyriPic: lyriPicCard)
                }
            }
        }
    }
}

//struct TrackLyriPicCards_Previews: PreviewProvider {
//    static var previews: some View {
//        TrackLyriPicCards()
//    }
//}
