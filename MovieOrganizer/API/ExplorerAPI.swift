//
//  ExplorerAPI.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/10/26.
//

import Foundation
import FirebaseFirestore


class ExplorerAPI {
    static let shared = ExplorerAPI()
    var db = Firestore.firestore()
    
    private init() {
        
    }
    
//    struct FolderMovie {
//        let name: String
//        let spot: String
//    }
//
//    struct Folder {
//        let id: String
//        let name: String
//        let movies: [FolderMovie]
//    }
    
    func getAllFolders() async throws -> [Folder] {
        
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
