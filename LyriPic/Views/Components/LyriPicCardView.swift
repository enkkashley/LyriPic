//
//  LyriPicCardView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 21/09/2020.
//

import SwiftUI

struct LyriPicCardView: View {
    var body: some View {
        VStack {
            Text("""
You turn graves into gardens
You turn bones into armies
You turn seas into highways

You are the only one who can
""")
                .font(.system(.body, design: .serif))
                .foregroundColor(.white)
            
            Spacer()
            
            HStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text("Graves Into Gardens,")
                    Text("Elevation Worship")
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
        LyriPicCardView()
    }
}
