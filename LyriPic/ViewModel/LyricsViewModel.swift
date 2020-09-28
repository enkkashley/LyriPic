//
//  LyricsViewModel.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 27/09/2020.
//

import Foundation

class LyricsViewModel: ObservableObject {
    @Published var lyrics: Lyrics?
    @Published var error: NetworkError?
    
    func getTrackLyrics(trackId: Int) {
        NetworkManager.shared.getTrackLyrics(trackId: trackId) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let lyrics):
                DispatchQueue.main.async {
                    self.lyrics = lyrics
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error
                }
            }
        }
    }
}
