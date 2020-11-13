//
//  SearchBar.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 09/11/2020.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    private let searchButtonClicked: () -> Void
    
    init(searchButtonClicked: @escaping () -> Void) {
        self.searchButtonClicked = searchButtonClicked
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        var parent: SearchBar
        
        init(_ parent: SearchBar) {
            self.parent = parent
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            parent.searchButtonClicked()
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            print("cancelButtonClicked")
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            print("textDidChange")
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Song title, lyrics or artist name"
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        
    }
}
