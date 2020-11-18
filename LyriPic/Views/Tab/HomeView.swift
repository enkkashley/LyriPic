//
//  HomeView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 21/09/2020.
//

//import SwiftUI
//
//struct HomeView: View {
//    @ObservedObject var topTracks = TopTracksViewModel()
//    @ObservedObject var lyricsViewModel = LyricsViewModel()
//
//    func getLyriPicCards() {
//        lyricsViewModel.tracks = topTracks.tracks
//        lyricsViewModel.getLyricsAndSlice()
//    }
//
//    var body: some View {
//        ScrollView(showsIndicators: false) {
//            VStack(spacing: 30) {
//                HeaderView(title: "Popular", subtitle: "LyriPics from top tracks in your country")
//                    .padding(.top, 30)
//                    .padding(.leading, 20)
//
//                ScrollView(.horizontal, showsIndicators: false) {
//                    LazyHStack(spacing: 20) {
//                        if lyricsViewModel.error == nil && !lyricsViewModel.lyriPicCards.isEmpty {
//                            ForEach(lyricsViewModel.lyriPicCards) { lyriPic in
//                                LyriPicCardView(lyriPic: lyriPic)
//                            }
//                        } else {
//                            // handle error
//                        }
//                    }
//                    .padding(.bottom, 20)
//                    .padding(.horizontal, 20)
//                }
//
//                HeaderView(title: "Tracks", subtitle: "Create LyriPics from top tracks in your country")
//                    .padding(.leading, 20)
//
//                if topTracks.error == nil && !topTracks.tracks.isEmpty {
//                    VStack(spacing: 10) {
//                        ForEach(topTracks.tracks.indices, id: \.self) { index in
//                            TrackCellView(track: topTracks.tracks[index])
//                                .padding(.horizontal, 20)
//                            Divider()
//                        }
//                    }
//                    .onAppear {
//                        getLyriPicCards()
//                    }
//                } else {
//                    // handle error
//                }
//            }
//        }
//    }
//}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
