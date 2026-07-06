//
//  MovieListView.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/5/26.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel()

    var body: some View {
        VStack(spacing: 40) {
            VStack {
                
            }
            .frame(height: 60)
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.95
            }
            .background(
                // --- Top Layer: The button itself ---
                RoundedRectangle(cornerRadius: 10)
                    .fill(.offwhite)
                    .overlay(
                        // Add the thin black border
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                    )
            )
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.black)
                }
                // The magic offsets:
                    .offset(x: 0, y: 5)  // Slightly right, heavily down
                    .scaleEffect(x: 1.0, y: 1.0)
            )
            VStack {
                ScrollView {
                    ForEach(viewModel.movies, id: \.id) { movie in
                        MovieView(movie: movie)
                    }
                    
                }
                .padding(.bottom, 5)
                .padding(.top, 10)
            }
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.95
            }
            // height
            .containerRelativeFrame(.vertical) { length, axis in
                return length * 0.60
            }
            .background(
                // --- Top Layer: The button itself ---
                RoundedRectangle(cornerRadius: 20)
                    .fill(.backgroundTheme)
                    .overlay(
                        // Add the thin black border
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.black, lineWidth: 1)
                    )
            )
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                }
                // The magic offsets:
                    .offset(x: 0, y: 6)  // Slightly right, heavily down
                    .scaleEffect(x: 1.0, y: 1.0)
            )
            .onAppear {
                Task {
                    try await viewModel.getAllMovies()
                }
            }
        }
    }
}

#Preview {
    MovieListView()
}
