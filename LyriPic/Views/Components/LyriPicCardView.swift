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
                .font(.system(size: 19, weight: .bold))
                .foregroundColor(lyriPic.color.text)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            HStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text("\(lyriPic.track.trackName),")
                        .bold()
                    
                    Text(lyriPic.track.artistName)
                }
                .font(.system(size: 12))
                .foregroundColor(lyriPic.color.text)
            }
        }
        .padding(.top, 26)
        .padding(.horizontal, 20)
        .padding(.bottom, 16)
        .frame(maxWidth: .infinity)
        .frame(height: 198)
        .background(lyriPic.color.background)
        .cornerRadius(17)
        .shadow(color: lyriPic.color.background.opacity(0.2), radius: 4, x: 0, y: 5)
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
        LyriPicCardView(lyriPic: LyriPicCard(track: TrackInfo(trackId: 2, trackName: "Champion - Studio Version", artistName: "Dante Bowe"), lyrics: "I've tried so hard to see it \nTook me so long to believe it \nThat you choose someone like me \nTo carry your victory", color: LyriPicCardColor(text: Color(#colorLiteral(red: 0.1450980392, green: 0.631372549, blue: 0.5568627451, alpha: 1)), background: Color(#colorLiteral(red: 0, green: 0.3058823529, blue: 0.3921568627, alpha: 1)))))
    }
}
