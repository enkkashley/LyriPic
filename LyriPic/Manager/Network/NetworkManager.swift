//
//  NetworkManager.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 25/09/2020.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func getTopTracks(completion: @escaping (Result<TopTracks, NetworkError>) -> Void) {
        let endpoint = Endpoint.topTracks
        
        URLSession.shared.dataTask(with: endpoint.url) { data, response, error in
            if error != nil {
                completion(.failure(.unableToSendRequest))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let topTracks = try decoder.decode(TopTracks.self, from: data)
                completion(.success(topTracks))
            } catch {
                completion(.failure(.unableToDecode))
            }
            
        }
        .resume()
    }
    
    func getTrackLyrics(trackId: Int, completion: @escaping (Result<Lyrics, NetworkError>) -> Void) {
        let endpoint = Endpoint.trackLyrics(trackId: trackId)
        
        URLSession.shared.dataTask(with: endpoint.url) { data, response, error in
            if error != nil {
                completion(.failure(.unableToSendRequest))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let lyrics = try decoder.decode(Lyrics.self, from: data)
                completion(.success(lyrics))
            } catch {
                completion(.failure(.unableToDecode))
            }
            
        }
        .resume()
    }
    
    func searchTracks(query: String, page: Int, completion: @escaping (Result<SearchTrack, NetworkError>) -> Void) {
        let endpoint = Endpoint.searchTracks(query: query, page: page)
        
        URLSession.shared.dataTask(with: endpoint.url) { data, response, error in
            if error != nil {
                completion(.failure(.unableToSendRequest))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let tracks = try decoder.decode(SearchTrack.self, from: data)
                completion(.success(tracks))
            } catch {
                completion(.failure(.unableToDecode))
            }
            
        }
        .resume()
    }
}
