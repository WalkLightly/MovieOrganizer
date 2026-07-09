//
//  Genre.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/7/26.
//

import Foundation

struct Genre: Identifiable {
    let id: String
    let name: String
    let abbreviation: String
    let movies: [String]
}
