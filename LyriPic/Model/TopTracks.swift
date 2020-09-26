//
//  TopTracks.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 26/09/2020.
//

import Foundation

struct TopTracks: Decodable {
    let message: Response
    
    struct Response: Decodable {
        let body: TrackList
    }
}
