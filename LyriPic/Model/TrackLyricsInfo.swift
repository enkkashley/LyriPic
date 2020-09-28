//
//  TrackLyricsInfo.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 27/09/2020.
//

import Foundation

struct TrackLyricsInfo: Decodable {
    let lyricsId: Int
    let lyricsBody: String
    let lyricsCopyright: String
}
