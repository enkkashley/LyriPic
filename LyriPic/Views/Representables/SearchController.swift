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
    
    init(searchQuery: Binding<String>, searchButtonClicked: @escaping () -> Void) {
        self._searchQuery = searchQuery
        self.searchButtonClicked = searchButtonClicked
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
            print("cancelButtonClicked")
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
  
        override func viewDidAppear(_ animated: Bool) {
            self.parent?.navigationController?.navigationBar.sizeToFit()
        }
        
        var searchController: UISearchController? {
            get {
                self.parent?.navigationItem.searchController
            }
            
            set {
                self.parent?.navigationItem.searchController = newValue
            }
        }
    }
}
