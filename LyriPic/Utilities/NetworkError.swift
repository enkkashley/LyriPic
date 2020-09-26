//
//  NetworkError.swift
//  LyriPic
//
//  Created by Emmanuel Ashley on 26/09/2020.
//

import Foundation

enum NetworkError: String, Error {
    case unableToDecode = "Failed to decode data"
    case unableToSendRequest = "Unable to send request"
    case invalidURL = "Invalid URL"
    case invalidResponse = "Invalid response"
    case invalidData = "Invalid data"
}
