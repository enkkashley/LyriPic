//
//  TabBar.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 09/11/2020.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
