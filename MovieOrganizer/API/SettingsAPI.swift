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
    
    func getAllGenresForBreakdown() async throws -> [Genre] {
        
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
    
    func getAllGenresForSettings() async throws -> [Genre] {
        var genres: [Genre] = []
        
        do {
          let querySnapshot = try await db.collection("genres")
                .order(by: "name", descending: false).getDocuments()

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
    
    func getAllFoldersForSettings() async throws -> [Folder] {
        
        var folders: [Folder] = []
        
        do {
          let querySnapshot = try await db.collection("folders")
                .order(by: "name", descending: false).getDocuments()
            
          for document in querySnapshot.documents {
              let folderData = document.data()
              
              let folder = Folder(
                            id: document.documentID,
                            name: folderData["name"] as? String ?? "",
                            movies: parseFolderData(data: folderData["movies"] as? [[String: Any]] ?? [[:]])
                        )
              
              folders.append(folder)
          }
        } catch {
          print("Error getting folders: \(error)")
        }
        
        print(folders)
        
        return folders
    }
    
    func parseFolderData(data: [[String: Any]]) -> [FolderMovie] {
        var folderMovies: [FolderMovie] = []

        let fmArray = data

        for fMovie in fmArray {

            let name = fMovie["name"] as? String ?? ""
            let spot = fMovie["spot"] as? String ?? ""

            folderMovies.append(
                FolderMovie(
                    name: name,
                    spot: spot
                )
            )

        }

        return folderMovies
    }
}
