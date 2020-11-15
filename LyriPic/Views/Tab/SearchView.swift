//
//  SearchView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 09/11/2020.
//

import SwiftUI

struct SearchView: View {
    @StateObject var searchTrackViewModel = SearchTrackViewModel()
    
    @State private var searchQuery = ""
    @State private var page = 1
    
    var body: some View {
        NavigationView {
            VStack {
                SearchResultsView(searchTrackViewModel: searchTrackViewModel)
            }
            .navigationTitle("Search")
            .overlay(
//                 .frame(width: 0, height: 0) to prevent the controller's view from obscuring the main view (List in this case)
                SearchController(
                    searchQuery: $searchQuery,
                    searchButtonClicked: {
                        searchTrackViewModel.search(searchQuery: searchQuery, page: page)
                    },
                    cancelButtonClicked: {
                        searchQuery = ""
                    }
                )
                .frame(width: 0, height: 0)
            )
            .onChange(of: searchQuery) { newSearchQueryValue in
                if newSearchQueryValue.isEmpty {
                    searchTrackViewModel.reset()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
