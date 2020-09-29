//
//  LyriPicCardView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 21/09/2020.
//

import SwiftUI

struct LyriPicCardView: View {
    @State private var isPresented = false
    
    let lyriPic: LyriPicCard
    
    var body: some View {
        VStack {
            Text(lyriPic.lyrics)
                .font(.system(.body, design: .default))
                .foregroundColor(.white)
                .frame(width: 240, alignment: .leading)
            
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
        .frame(width: 270, height: 300)
        .background(Color(#colorLiteral(red: 1, green: 0.737254902, blue: 0.01960784314, alpha: 1)))
        .cornerRadius(17)
        .shadow(color: Color(#colorLiteral(red: 1, green: 0.737254902, blue: 0.01960784314, alpha: 1)).opacity(0.2), radius: 4, x: 0, y: 5)
        .onTapGesture {
            isPresented.toggle()
        }
        .fullScreenCover(isPresented: $isPresented) {
            LyriPicModalView(lyriPic: lyriPic)
        }
    }
}

struct LyriPicCardView_Previews: PreviewProvider {
    static var previews: some View {
        LyriPicCardView(lyriPic: LyriPicCard(track: TrackInfo(trackId: 2, trackName: "As It Is In Heaven", artistName: "Hillsong UNITED"), lyrics: "Loading..."))
    }
}
