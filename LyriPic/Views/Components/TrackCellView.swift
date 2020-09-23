//
//  TrackCellView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 23/09/2020.
//

import SwiftUI

struct TrackCellView: View {
    var body: some View {
        HStack(spacing: 11) {
            Text("1.")
                .fontWeight(.light)
            
            HStack {
                Color.gray
                    .frame(width: 30, height: 30)
                    .cornerRadius(4)
                
                VStack(alignment: .leading) {
                    Text("Behold (Then Sings My Soul)")
                        .font(.system(size: 13))
                        .bold()
                    Text("Hillsong UNITED")
                        .font(.system(size: 13))
                }
            }
            
            Spacer()
        }
    }
}

struct TrackCellView_Previews: PreviewProvider {
    static var previews: some View {
        TrackCellView()
    }
}
