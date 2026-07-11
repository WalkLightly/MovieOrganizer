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
}
