//
//  SearchResultView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 14/11/2020.
//

import SwiftUI

struct SearchResultsView: View {
    
    @ObservedObject var searchTrackViewModel: SearchTrackViewModel
    
    var body: some View {
        if searchTrackViewModel.isLoading {
            ProgressView()
        } else {
            if !searchTrackViewModel.tracks.isEmpty && searchTrackViewModel.error == nil {
                if searchTrackViewModel.tracks.isEmpty {
                    Text("No tracks found.")
                } else {
                    List(searchTrackViewModel.tracks) { track in
                        NavigationLink(destination: Text("Hi")) {
                            TrackCellView(track: track)
                                .onAppear {
                                    searchTrackViewModel.loadMoreTracksIfNeeded(currentTrack: track)
                                }
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            } else if searchTrackViewModel.tracks.isEmpty && searchTrackViewModel.error != nil {
                Text("Error: \(searchTrackViewModel.error!.rawValue)")
            } else {
                Text("Search for track by artist name, song title or lyrics")
                    .frame(width: 241)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

//struct SearchResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultView()
//    }
//}
