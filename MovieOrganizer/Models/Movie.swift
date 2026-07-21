//
//  Movie.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/5/26.
//

import Foundation
var m = Movie(id: "1", isCableRecording: false, name: "Test 1", genres: ["Fantasy", "Comedy"], folder: "H", location: "12", type: "DVD")
var m2 = Movie(id: "2", isCableRecording: false, name: "Test 1", genres: ["Fantasy", "Comedy"], folder: "H", location: "12", type: "DVD")

struct Movie {
    var id: String
    var isCableRecording: Bool
    var name: String
    var genres: [String]
    var folder: String
    var location: String
    var type: String
}

