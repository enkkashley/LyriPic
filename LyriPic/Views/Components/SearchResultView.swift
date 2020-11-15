//
//  SearchResultView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 14/11/2020.
//

import SwiftUI

struct SearchResultsView: View {
    
    @StateObject var searchTrackViewModel: SearchTrackViewModel
    
    var body: some View {
        if searchTrackViewModel.isLoading {
            ProgressView()
        } else {
            if searchTrackViewModel.tracks != nil && searchTrackViewModel.error == nil {
                List(searchTrackViewModel.tracks!.message.body.trackList) { track in
                    TrackCellView(track: track)
                }
                .listStyle(PlainListStyle())
            } else if searchTrackViewModel.tracks == nil && searchTrackViewModel.error != nil {
                Text("Error")
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
