//
//  HeaderView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 23/09/2020.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.largeTitle)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 15))
            }
            
            Spacer()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Popular", subtitle: "LyriPics from top tracks in your country")
    }
}
