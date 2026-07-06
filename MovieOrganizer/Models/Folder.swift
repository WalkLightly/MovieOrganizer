//
//  Folder.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/5/26.
//

import Foundation

struct FolderMovie {
    let name: String
    let spot: String
}
//var m = Movie(id: "1", isCableRecording: false, name: "Test 1", genres: ["Fantasy", "Comedy"], folder: "H", location: "12", type: "DVD")
//var m2 = Movie(id: "2", isCableRecording: false, name: "Test 1", genres: ["Fantasy", "Comedy"], folder: "H", location: "12", type: "DVD")

struct Folder {
    let id: String
    let name: String
    let movies: [FolderMovie]
}
