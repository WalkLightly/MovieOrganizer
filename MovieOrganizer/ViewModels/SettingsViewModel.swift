//
//  SettingsViewModel.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/5/26.
//

import Foundation
import Observation
internal import Combine

class SettingsViewModel: ObservableObject {
    @Published var folders: [Folder] = []
    @Published var genres: [Genre] = []
    @Published var isLoadingFolders: Bool = false
    @Published var isLoadingGenres: Bool = false
    
    init () {
        Task {
            try await getAllGenres()
        }
    }
    
    func getAllGenres() async throws -> Void {
        
        self.isLoadingGenres = true
        do {
            self.genres = try await SettingsAPI.shared.getAllGenres()
            
            self.genres.sort { $0.movies.count > $1.movies.count }
            self.isLoadingGenres = false
        } catch {
            print("error found")
        }
    }
}
