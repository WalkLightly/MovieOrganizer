//
//  DataViewModel.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/7/26.
//
import Foundation
import Observation
internal import Combine

class DataViewModel: ObservableObject {
    @Published var genres: [Genre] = []
    @Published var isLoadingGenres: Bool = false
    
    init () {
        Task {
            try await getGenresForBreakdown()
        }
    }
    
    func getGenresForBreakdown() async throws -> Void {
        
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
