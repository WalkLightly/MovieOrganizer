//
//  NewItemViewModel.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/21/26.
//

import Foundation
import Observation
internal import Combine

class NewItemViewModel: ObservableObject {
    @Published var genres: [String] = []
    @Published var folders: [String] = []
    
    init () {
        Task {
            try await getGenres()
            try await getFolders()
        }
    }
    
    func getFolders() async throws -> [String] {
        var folders: [String] = []
        
        do {
            folders = try await NewItemAPI.shared.getAllFolders().map({$0.name})
            self.folders = folders
        } catch {
            print("error found")
        }
        
        return folders
    }
    
    func getGenres() async throws -> [String] {
        var genres: [String] = []
        do {
            genres = try await NewItemAPI.shared.getAllGenres().map({$0.name})
            self.genres = genres
        } catch {
            print("error found")
        }
        
        return genres
    }
}
