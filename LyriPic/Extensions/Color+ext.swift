//
//  Color+ext.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 19/11/2020.
//

import SwiftUI

extension Color {
   static func cardColors() -> [LyriPicCardColor] {
        [
            LyriPicCardColor(text: Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), background: Color(#colorLiteral(red: 1, green: 0.737254902, blue: 0.01960784314, alpha: 1))),
            LyriPicCardColor(text: Color(#colorLiteral(red: 0.2392156863, green: 0.6470588235, blue: 0.8509803922, alpha: 1)), background: Color(#colorLiteral(red: 1, green: 0.9333333333, blue: 0.5333333333, alpha: 1))),
            LyriPicCardColor(text: Color(#colorLiteral(red: 0.8784313725, green: 0.3215686275, blue: 0.5921568627, alpha: 1)), background: Color(#colorLiteral(red: 0.9529411765, green: 0.7294117647, blue: 0.8392156863, alpha: 1))),
            LyriPicCardColor(text: Color(#colorLiteral(red: 0.1450980392, green: 0.631372549, blue: 0.5568627451, alpha: 1)), background: Color(#colorLiteral(red: 0, green: 0.3058823529, blue: 0.3921568627, alpha: 1))),
            LyriPicCardColor(text: Color(#colorLiteral(red: 0, green: 0.3058823529, blue: 0.3921568627, alpha: 1)), background: Color(#colorLiteral(red: 0, green: 0.6470588235, blue: 0.8117647059, alpha: 1)))
//            LyriPicCardColor(text: Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), background: Color(#colorLiteral(red: 1, green: 0.737254902, blue: 0.01960784314, alpha: 1)))
        ]
    }
}
