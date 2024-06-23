//
//  MoviesModel.swift
//  SearchMovies
//
//  Created by Лидия Пятаева on 23.06.2024.
//

import Foundation

struct Movie: Codable {
    let Title: String
    let Year: String
    let Rated: String
    let Released: String
    let Runtime: String
    let Genre: String 
    let Director: String
    let Writer: String
    let Actors: String
    let Plot: String
    let Language: String
    let Country: String
    let Awards: String
    let Poster: String
    let Ratings: [Rating]
    let Metascore: String
    let imdbRating: String
    let imdbVotes: String
    let imdbID: String
    let `Type`: String
    let DVD: String
    let BoxOffice: String
    let Production: String
    let Website: String
    let Response: String
}

struct Rating: Codable {
    let Source: String
    let Value: String
}

