//
//  SearchTrackViewModel.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 11/11/2020.
//

import Foundation

class SearchTrackViewModel: ObservableObject {
    @Published var tracks: SearchTrack?
    @Published var error: NetworkError?
    @Published var isLoading = false
    
    func search(searchQuery: String, page: Int) {
        isLoading.toggle()
        
        NetworkManager.shared.searchTracks(query: searchQuery, page: page) { result in
            DispatchQueue.main.async {
                self.isLoading.toggle()
                
                switch result {
                case .success(let tracks):
                    self.tracks = tracks
                    
                case .failure(let error):
                    self.error = error
                }
            }
        }
    }
    
    func reset() {
        if tracks != nil || error != nil {
            tracks = nil
            error = nil
        }
    }
}
