//
//  LyriPicCardView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 21/09/2020.
//

import SwiftUI

struct LyriPicCardView: View {
    let track: Track
    
    @ObservedObject var lyricsViewModel = LyricsViewModel()
    
    init(track: Track) {
        self.track = track
        lyricsViewModel.getTrackLyrics(trackId: track.track.trackId)
    }
    
    var body: some View {
        VStack {
            if lyricsViewModel.error == nil && lyricsViewModel.lyrics != nil {
                Text(lyricsViewModel.lyrics!.message.body.lyrics.lyricsBody)
                    .font(.system(.body, design: .serif))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            HStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text("\(track.track.trackName),")
                    Text(track.track.artistName)
                        .bold()
                }
                .font(.system(size: 15, weight: .regular, design: .serif))
                .foregroundColor(.white)
            }
        }
        .padding(.top, 30)
        .padding(.horizontal, 15)
        .padding(.bottom, 15)
        .frame(width: 270, height: 270)
        .background(Color(#colorLiteral(red: 1, green: 0.737254902, blue: 0.01960784314, alpha: 1)))
        .cornerRadius(17)
        .shadow(color: Color(#colorLiteral(red: 1, green: 0.737254902, blue: 0.01960784314, alpha: 1)).opacity(0.2), radius: 4, x: 0, y: 5)
    }
}

struct LyriPicCardView_Previews: PreviewProvider {
    static var previews: some View {
        LyriPicCardView(track: Track(track: TrackInfo(trackId: 2, trackName: "Graves Into Gardens", artistName: "Elevation Worship")))
    }
}
