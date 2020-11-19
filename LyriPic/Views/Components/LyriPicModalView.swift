//
//  LyriPicModalView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 29/09/2020.
//

import SwiftUI

struct LyriPicModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var backgroundColor = Color(#colorLiteral(red: 1, green: 0.737254902, blue: 0.01960784314, alpha: 1))
   
    let lyriPic: LyriPicCard
    
    var body: some View {
        VStack {
            HStack(spacing: 14) {
                //Dismiss Button
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .renderingMode(.original)
                        .font(.system(size: 20))
                }
                
                Spacer()
                
                // Change Font Button
                Button {
                    print("Change Font")
                } label: {
                    Image(systemName: "textformat.size")
                        .renderingMode(.original)
                        .font(.system(size: 20))
                }
                
                // Color Picker (Background)
                ColorPicker("", selection: $backgroundColor, supportsOpacity: false)
                    .frame(width: 30,height: 30)
               
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
            .padding(.horizontal, 30)
            
            Spacer()
            
            VStack(spacing: 20) {
                Text(lyriPic.lyrics)
                    .font(.system(size: 20, weight: .heavy, design: .default))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                

                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("\(lyriPic.track.trackName),")
                            .font(.system(size: 15, weight: .medium, design: .default))
                        Text(lyriPic.track.artistName)
                            .font(.system(size: 15, weight: .heavy, design: .default))
                    }
                    .foregroundColor(.white)
                }
            }
            .padding(.top, 30)
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            
            Spacer()
        }
        .padding(.top, 20)
    }
}

//struct LyriPicModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        LyriPicModalView(lyriPic: LyriPicCard(track: TrackInfo(trackId: 2, trackName: "As It Is In Heaven", artistName: "Hillsong UNITED"), lyrics: "Loading..."))
//    }
//}
