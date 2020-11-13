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
    
    func search(searchQuery: String, page: Int) {
        NetworkManager.shared.searchTracks(query: searchQuery, page: page) { result in
            switch result {
            case .success(let tracks):
                DispatchQueue.main.async {
                    self.tracks = tracks
                }
            case .failure(let error):
                self.error = error
            }
        }
    }
}
