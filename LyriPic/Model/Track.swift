//
//  Track.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 26/09/2020.
//

import Foundation

struct Track: Equatable, Identifiable, Decodable {
    let id = UUID()
    let track: TrackInfo
    
    static func ==(lhs: Track, rhs: Track) -> Bool {
        lhs.id == rhs.id
    }
}
