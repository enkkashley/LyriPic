//
//  TrackCellView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 23/09/2020.
//

import SwiftUI

struct TrackCellView: View {
    let track: Track
    
    var body: some View {
        HStack(spacing: 11) {
            VStack(alignment: .leading) {
                Text(track.track.trackName)
                    .font(.system(size: 13))
                    .bold()
                Text(track.track.artistName)
                    .font(.system(size: 13))
            }
            Spacer()
        }
        .padding(5)
    }
}

struct TrackCellView_Previews: PreviewProvider {
    static var previews: some View {
        TrackCellView(track: Track(track: TrackInfo(trackId: 1, trackName: "Behold (Then Sings My Soul)", artistName: "Hillsong UNITED")))
    }
}
