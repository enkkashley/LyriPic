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

            if searchTrackViewModel.totalTracksFound == nil {
                Text("Search for track by artist name, song title or lyrics")
                    .frame(width: 241)
                    .multilineTextAlignment(.center)
                
            } else if searchTrackViewModel.totalTracksFound == 0 {
                Text("No tracks found.")
                
            } else {
                List(searchTrackViewModel.tracks) { track in
                    NavigationLink(destination: TrackLyriPicCardsView(track)) {
                        TrackCellView(track: track)
                            .onAppear {
                                searchTrackViewModel.loadMoreTracksIfNeeded(currentTrack: track)
                            }
                    }
                }
                .listStyle(PlainListStyle())
            }
            
            if searchTrackViewModel.error != nil {
                Text("Error: \(searchTrackViewModel.error!.rawValue)")
            }
        }
    }
}

//struct SearchResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultView()
//    }
//}
