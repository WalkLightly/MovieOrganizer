//
//  SettingsAPI.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/5/26.
//

import Foundation
import FirebaseFirestore


class SettingsAPI {
    
    
    static let shared = SettingsAPI()
    var db = Firestore.firestore()
    
    private init() {
        
    }
    
    func getAllGenres() async throws -> [Genre] {
        
        var genres: [Genre] = []
        
        do {
          let querySnapshot = try await db.collection("genres").getDocuments()
          for document in querySnapshot.documents {
              let genreData = document.data()
              
              let genre = Genre(
                            id: document.documentID,
                            name: genreData["name"] as? String ?? "",
                            abbreviation: genreData["abbreviation"] as? String ?? "",
                            movies: genreData["movies"] as? [String] ?? []
                        )
              
              genres.append(genre)
          }
        } catch {
          print("Error getting genres: \(error)")
        }
        
        return genres
    }
    
//    func getAllFolders () async throws -> [Folder] {
//        var movies: [Movie] = []
//        
//        do {
//          let querySnapshot = try await db.collection("movies")
//                .whereField("name", isNotEqualTo: "")
//                .order(by: "name", descending: false).getDocuments()
//            
//          for document in querySnapshot.documents {
//              let movieData = document.data()
//              let movieName = movieData["name"] as? String ?? ""
//              
//              let movie = Movie(
//                id: document.documentID,
//                isCableRecording: movieData["isCableRecording"] as? Bool ?? false,
//                name: movieName.trimmingCharacters(in: .whitespacesAndNewlines) == "" ? "Unassigned Spot" : movieName,
//                genres: movieData["genres"] as? [String] ?? [],
//                folder: movieData["folder"] as? String ?? "",
//                location: movieData["location"] as? String ?? "",
//                type: movieData["type"] as? String ?? "",
//              )
//              movies.append(movie)
//          }
//        } catch {
//          print("Error getting documents: \(error)")
//        }
//        
//        //print(movies)
//        
//        return movies
//    }
}
