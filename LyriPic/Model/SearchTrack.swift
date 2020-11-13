//
//  SearchTrack.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 10/11/2020.
//

import Foundation

struct SearchTrack: Decodable {
    let message: Response
    
    struct Response: Decodable {
        let body: TrackList
    }
}
