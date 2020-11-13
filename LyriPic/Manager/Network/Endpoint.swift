//
//  Endpoint.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 26/09/2020.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.musixmatch.com"
        components.path = "/ws/1.1/\(path)"
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL Components: \(components)")
        }
        
        print("🌐 \(url)")
        return url
    }
}

extension Endpoint {
    static var topTracks: Self {
        Endpoint(path: "chart.tracks.get", queryItems: [
            URLQueryItem(name: "country", value: "gh"),
            URLQueryItem(name: "chart_name", value: "top"),
            URLQueryItem(name: "f_has_lyrics", value: "1"),
            URLQueryItem(name: "apikey", value: Constants.apiKey)
        ])
    }
    
    static func searchTracks(query: String, page: Int) -> Endpoint {
        Endpoint(path: "track.search", queryItems: [
            URLQueryItem(name: "f_has_lyrics", value: "1"),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "page_size", value: "10"),
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "apikey", value: Constants.apiKey)
        ])
    }
    
    static func trackLyrics(trackId: Int) -> Self {
        Endpoint(path: "track.lyrics.get", queryItems: [
            URLQueryItem(name: "track_id", value: "\(trackId)"),
            URLQueryItem(name: "apikey", value: Constants.apiKey)
        ])
    }
    
    
}
