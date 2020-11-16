//
//  TestView.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 16/11/2020.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        List {
            ForEach(1...1000, id: \.self) { id in
                Text("Row: \(id)")
                    .onAppear {
                        print("Loaded Row: \(id)")
                    }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
