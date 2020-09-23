//
//  HomeView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 21/09/2020.
//

import SwiftUI

struct HomeView: View { 
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                HeaderView(title: "Popular", subtitle: "LyriPics from top tracks in your country")
                    .padding(.top, 30)
                    .padding(.leading, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                            LyriPicCardView()
                        }
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 20)
                }
                
                HeaderView(title: "Tracks", subtitle: "Create LyriPics from top tracks in your country")
                    .padding(.leading, 20)
                
                
                VStack(spacing: 10) {
                    ForEach(0 ..< 10) { item in
                        TrackCellView()
                            .padding(.horizontal, 20)
                        Divider()
                    }
                }
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
