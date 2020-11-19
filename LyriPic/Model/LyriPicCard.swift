//
//  LyriPicCard.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 28/09/2020.
//

import Foundation

struct LyriPicCard: Identifiable {
    let id = UUID()
    let track: TrackInfo
    let lyrics: String
    let color: LyriPicCardColor
}
