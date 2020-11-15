//
//  SearchController.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 10/11/2020.
//

import SwiftUI

struct SearchController: UIViewControllerRepresentable {
    
    @Binding var searchQuery: String
    
    private let searchButtonClicked: () -> Void
    private let cancelButtonClicked: () -> Void
    
    init(searchQuery: Binding<String>, searchButtonClicked: @escaping () -> Void, cancelButtonClicked: @escaping () -> Void) {
        self._searchQuery = searchQuery
        self.searchButtonClicked = searchButtonClicked
        self.cancelButtonClicked = cancelButtonClicked
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        var parent: SearchController
        let uiSearchController: UISearchController
        
        init(_ parent: SearchController) {
            self.parent = parent
            
            uiSearchController = UISearchController()
            super.init()
            uiSearchController.searchBar.delegate = self
            uiSearchController.searchBar.autocapitalizationType = .none
            uiSearchController.obscuresBackgroundDuringPresentation = false
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            parent.searchButtonClicked()
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            parent.cancelButtonClicked()
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            parent.searchQuery = searchText
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> SearchControllerWrapper {
        SearchControllerWrapper()
    }
    
    func updateUIViewController(_ uiViewController: SearchControllerWrapper, context: Context) {
        uiViewController.searchController = context.coordinator.uiSearchController
        uiViewController.searchController?.searchBar.text = searchQuery
    }
    
    class SearchControllerWrapper: UIViewController {
 
        override func viewWillAppear(_ animated: Bool) {
            self.parent?.navigationController?.navigationBar.sizeToFit()
            self.parent?.navigationItem.searchController = searchController
        }
        
        var searchController: UISearchController? {
            didSet {
                self.parent?.navigationItem.searchController = searchController
            }
        }
    }
}
