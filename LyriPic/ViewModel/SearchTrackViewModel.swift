//
//  SearchTrackViewModel.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 11/11/2020.
//

import Foundation

class SearchTrackViewModel: ObservableObject {
    @Published var tracks = [Track]()
    @Published var error: NetworkError?
    @Published var totalTracksFound: Int!
    @Published var isLoading = false
    
    var searchQuery: String!
    
    var hasMoreTracks = false
    var page = 1
    
    func search(searchQuery: String) {
        if page == 1 { isLoading.toggle() }
        self.searchQuery = searchQuery
        
        NetworkManager.shared.searchTracks(query: searchQuery, page: page) { result in
            DispatchQueue.main.async {
                if self.page == 1 { self.isLoading.toggle() }
                
                switch result {
                case .success(let response):
                    self.handleSuccess(response)
                    
                case .failure(let error):
                    self.error = error
                }
            }
        }
    }
    
    func handleSuccess(_ response: SearchTrack) {
        let trackList = response.message.body.trackList
        totalTracksFound = response.message.header.available
        
        if page == 1 {
            tracks = trackList
        } else {
            tracks.append(contentsOf: trackList)
        }
        
        if trackList.count < 10 {
            hasMoreTracks = false
        } else {
            hasMoreTracks = true
        }
    }
    
// Resource: https://www.donnywals.com/implementing-an-infinite-scrolling-list-with-swiftui-and-combine/
    func loadMoreTracksIfNeeded(currentTrack track: Track) {
        let thresholdIndex = tracks.index(tracks.endIndex, offsetBy: -5)
        
        // get index of track found in array
        let trackIndex = tracks.firstIndex { element -> Bool in
            element == track
        }
        
        if thresholdIndex == trackIndex {
            if hasMoreTracks {
                page += 1
                search(searchQuery: searchQuery)
            }
        }
    }
    
    func reset() {
        if totalTracksFound == 0 {
            totalTracksFound = nil
        } else {
            if !tracks.isEmpty || error != nil {
                tracks = []
                error = nil
                totalTracksFound = nil
                page = 1
                hasMoreTracks = false
            }
        }
    }
}
