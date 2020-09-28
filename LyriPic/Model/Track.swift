//
//  Track.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 26/09/2020.
//

import Foundation

struct Track: Identifiable, Decodable {
    let id = UUID()
    let track: TrackInfo
}
