//
//  MovieListViewModel.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/5/26.
//

import Foundation
import Observation
internal import Combine

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoadingMovies: Bool = false
    
    func getAllMovies() async throws -> [Movie] {
        self.isLoadingMovies = true
        
        do {
            self.movies = try await MoviesAPI.shared.getAllMovies()
            self.isLoadingMovies = false
            
        } catch {
            print("error found")
        }
        
        return self.movies
    }
}
    
