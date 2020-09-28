//
//  LyricsViewModel.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 27/09/2020.
//

import Foundation

class LyricsViewModel: ObservableObject {
    @Published var lyriPicCards = [LyriPicCard]()
    
    var lyrics: TrackLyricsInfo?
    var error: NetworkError?
    
    var tracks: [Track]?
    
    func getTrackLyrics(trackId: Int, completion: @escaping () -> Void) {
        NetworkManager.shared.getTrackLyrics(trackId: trackId) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let lyrics):
                self.lyrics = lyrics.message.body.lyrics
           
            case .failure(let error):
                self.error = error
            }
            
            completion()
        }
    }
    
    func getLyricsAndSlice() {
        guard let tracks = tracks else { return }
    
        tracks.forEach { track in
            // make request
            getTrackLyrics(trackId: track.track.trackId) {
                // slice lyrics
                let slicedLyrics = self.lyrics!.lyricsBody.components(separatedBy: "\n\n")
                // create LyriPicCard object
                slicedLyrics.forEach { lyrics in
                    let lyriPicCard = LyriPicCard(track: track.track, lyrics: lyrics)
                    DispatchQueue.main.async {
                        self.lyriPicCards.append(lyriPicCard)
                    }
                }
            }
        }
    }
}
