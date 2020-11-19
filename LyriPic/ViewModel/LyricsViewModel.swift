//
//  LyricsViewModel.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 27/09/2020.
//

import SwiftUI

class LyricsViewModel: ObservableObject {
    @Published var lyriPicCards = [LyriPicCard]()
    @Published var isLoading = false
    
    var lyrics: TrackLyricsInfo?
    var error: NetworkError?
    
    let cardColors = Color.cardColors()
    
    func getTrackLyrics(trackId: Int, completion: @escaping () -> Void) {
        isLoading.toggle()
        
        NetworkManager.shared.getTrackLyrics(trackId: trackId) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                self.isLoading.toggle()
                
                switch result {
                case .success(let lyrics):
                    self.lyrics = lyrics.message.body.lyrics
                    
                case .failure(let error):
                    self.error = error
                }
                
                completion()
            }
        }
    }
    
    func getLyricsAndSlice(from track: Track) {
        // make request
        getTrackLyrics(trackId: track.track.trackId) {
            // TODO: check if request was successful or not
            
            // slice lyrics
            let slicedLyrics = self.lyrics!.lyricsBody.components(separatedBy: "\n\n")
            
            var cardColorIndex = 0
            // create LyriPicCard object
            slicedLyrics.forEach { lyrics in
                if cardColorIndex == self.cardColors.count { cardColorIndex = 0 }
                
                let lyriPicCard = LyriPicCard(track: track.track, lyrics: lyrics, color: self.cardColors[cardColorIndex])
                self.lyriPicCards.append(lyriPicCard)
                cardColorIndex += 1
            }
        }
    }
}
