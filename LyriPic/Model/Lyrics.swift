//
//  Lyrics.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 27/09/2020.
//

import Foundation

struct Lyrics: Decodable {
    let message: Response
    
    struct Response: Decodable {
        let body: TrackLyrics
    }
}
