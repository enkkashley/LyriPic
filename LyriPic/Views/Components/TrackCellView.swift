//
//  TrackCellView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 23/09/2020.
//

import SwiftUI

struct TrackCellView: View {
    let id: Int
    let track: Track
    
    var body: some View {
        HStack(spacing: 11) {
            VStack(alignment: .trailing) {
                Text("\(id + 1)")
                    .font(.system(size: 12))
                    .fontWeight(.light)
            }
            .frame(width: 20)
            
            
            HStack {
                Color.gray
                    .frame(width: 30, height: 30)
                    .cornerRadius(4)
                
                VStack(alignment: .leading) {
                    Text(track.track.trackName)
                        .font(.system(size: 13))
                        .bold()
                    Text(track.track.artistName)
                        .font(.system(size: 13))
                }
            }
            
            Spacer()
        }
    }
}

struct TrackCellView_Previews: PreviewProvider {
    static var previews: some View {
        TrackCellView(id: 0, track: Track(track: TrackInfo(trackId: 1, trackName: "Behold (Then Sings My Soul)", artistName: "Hillsong UNITED")))
    }
}
