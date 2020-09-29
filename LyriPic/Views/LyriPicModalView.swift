//
//  LyriPicModalView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 29/09/2020.
//

import SwiftUI

struct LyriPicModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let lyriPic: LyriPicCard
    
    var body: some View {
        VStack {
            HStack(spacing: 14) {
                Spacer()
                // Favorite Button
                Button {
                    print("Favorite")
                } label: {
                    Image(systemName: "bookmark")
                        .renderingMode(.original)
                        .font(.system(size: 20))
                }
                // Save Image Button
                Button {
                    print("Save Image")
                } label: {
                    Image(systemName: "square.and.arrow.down")
                        .renderingMode(.original)
                        .font(.system(size: 20))
                }
            }
            .padding(.trailing, 30)
            
            Spacer()
            
            VStack {
                Text(lyriPic.lyrics)
                    .font(.system(.body, design: .default))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("\(lyriPic.track.trackName),")
                        Text(lyriPic.track.artistName)
                            .bold()
                    }
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(.white)
                }
            }
            .padding(.top, 30)
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
            .frame(maxWidth: .infinity)
            .background(Color(#colorLiteral(red: 1, green: 0.737254902, blue: 0.01960784314, alpha: 1)))
            .shadow(color: Color(#colorLiteral(red: 1, green: 0.737254902, blue: 0.01960784314, alpha: 1)).opacity(0.2), radius: 4, x: 0, y: 5)
        }
        .padding(.top, 20)
    }
}

struct LyriPicModalView_Previews: PreviewProvider {
    static var previews: some View {
        LyriPicModalView(lyriPic: LyriPicCard(track: TrackInfo(trackId: 2, trackName: "As It Is In Heaven", artistName: "Hillsong UNITED"), lyrics: "Loading..."))
    }
}
