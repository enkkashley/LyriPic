//
//  SearchView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 09/11/2020.
//

import SwiftUI

struct SearchView: View {
    @State private var searchQuery = ""
    @State private var page = 1
    
    @StateObject var searchTrackViewModel = SearchTrackViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                SearchResultsView(searchTrackViewModel: searchTrackViewModel)
            }
            .navigationTitle("Search")
            .overlay(
                // .frame(width: 0, height: 0) to prevent the controller's view from obscuring the main view (List in this case)
                SearchController(searchQuery: $searchQuery,
                                 searchButtonClicked: {
                    print("searchButtonClicked: \(searchQuery)")
                    searchTrackViewModel.search(searchQuery: searchQuery, page: page)
                })
                .frame(width: 0, height: 0)
            )
        }
    }
}

struct SearchResultsView: View {
    
    @StateObject var searchTrackViewModel: SearchTrackViewModel
    
    var body: some View {
        if searchTrackViewModel.tracks != nil && searchTrackViewModel.error == nil {
            List(searchTrackViewModel.tracks!.message.body.trackList) { track in
                TrackCellView(id: 1, track: track)
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
