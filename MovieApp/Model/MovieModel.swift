//
//  MovieModel.swift
//  MovieApp
//
//  Created by mert Kanak on 14.12.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct MovieModel: Codable {
    let title, description: String
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case title
        case description
        case movies
    }
}

// MARK: - Movie
struct Movie: Codable {
    let id, title, releaseYear: String
}

