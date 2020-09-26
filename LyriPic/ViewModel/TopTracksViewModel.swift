//
//  TopTracksViewModel.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 26/09/2020.
//

import Foundation

class TopTracksViewModel: ObservableObject {
    @Published var tracks = [Track]()
    @Published var error: NetworkError?
    
    init() {
        getTopTracks()
    }
    
    func getTopTracks() {
        NetworkManager.shared.getTopTracks { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.tracks = response.message.body.trackList
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error
                }
            }
        }
    }
}
