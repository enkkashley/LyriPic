//
//  HomeView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 21/09/2020.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var topTracks = TopTracksViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                HeaderView(title: "Popular", subtitle: "LyriPics from top tracks in your country")
                    .padding(.top, 30)
                    .padding(.leading, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        if topTracks.error == nil {
                            ForEach(topTracks.tracks) { track in
                                LyriPicCardView(track: track)
                            }
                        } else {
                            // handle error
                        }
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 20)
                }
                
                HeaderView(title: "Tracks", subtitle: "Create LyriPics from top tracks in your country")
                    .padding(.leading, 20)
                
                VStack(spacing: 10) {
                    if topTracks.error == nil && !topTracks.tracks.isEmpty {
                        ForEach(topTracks.tracks.indices, id: \.self) { index in
                            TrackCellView(id: index, track: topTracks.tracks[index])
                                .padding(.horizontal, 20)
                            Divider()
                        }
                    } else {
                        // handle error
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
