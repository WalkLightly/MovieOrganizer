//
//  MovieListView.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/5/26.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel()
    @State var searchText: String = ""

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 30))
                    .foregroundStyle(.blueButtonTheme)
                TextField(
                    "",
                    text: $searchText,
                    prompt: Text("Search for a movie . . .").foregroundStyle(.blueTheme.opacity(0.5))
                )
                    .frame(height: 50)
                    .font(
                        .custom("PTSans-Narrow", size: 25)
                    )
                    .containerRelativeFrame(.horizontal) { length, axis in
                        return length * 0.67
                    }
                    .background(.offwhite)
                    .foregroundStyle(.black)
                Image(systemName: "xmark")
                    .font(.system(size: 30))
                    .foregroundStyle(.blueButtonTheme)
                    .opacity(searchText == "" ? 0 : 1)
                    .onTapGesture {
                        searchText = ""
                    }
            }
            .frame(height: 60)
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.95
            }
            .background(
                // --- Top Layer: The button itself ---
                RoundedRectangle(cornerRadius: 30)
                    .fill(.offwhite)
                    .overlay(
                        // Add the thin black border
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.black, lineWidth: 1)
                    )
            )
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
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
                .clipped()
            }
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.95
            }
            // height
            .containerRelativeFrame(.vertical) { length, axis in
                return length * 0.70
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
