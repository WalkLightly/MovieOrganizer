//
//  MoviesAPI.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/5/26.
//


//
//  MoviesAPI.swift
//  Bookshelf
//
//  Created by Michael Knight on 1/30/26.
//

import Foundation
import FirebaseFirestore


class MoviesAPI {
    static let shared = MoviesAPI()
    var db = Firestore.firestore()
    
    private init() {
        
    }
    
    func getAllMovies() async throws -> [Movie] {
        var movies: [Movie] = []
        
        do {
          let querySnapshot = try await db.collection("movies")
                .whereField("name", isNotEqualTo: "")
                .order(by: "name", descending: false).getDocuments()
            
          for document in querySnapshot.documents {
              let movieData = document.data()
              let movieName = movieData["name"] as? String ?? ""
              
              let movie = Movie(
                id: document.documentID,
                isCableRecording: movieData["isCableRecording"] as? Bool ?? false,
                name: movieName.trimmingCharacters(in: .whitespacesAndNewlines) == "" ? "Unassigned Spot" : movieName,
                genres: movieData["genres"] as? [String] ?? [],
                folder: movieData["folder"] as? String ?? "",
                location: movieData["location"] as? String ?? "",
                type: movieData["type"] as? String ?? "",
              )
              movies.append(movie)
          }
        } catch {
          print("Error getting documents: \(error)")
        }
        
        //print(movies)
        
        return movies
    }
}
