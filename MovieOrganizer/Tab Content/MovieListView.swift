//
//  MovieListView.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/5/26.
//

import SwiftUI

@MainActor
struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel()
    @State private var isShowingSheet: Bool = true
    @State var searchString: String = ""
    @FocusState private var isTextFieldFocused: Bool


    func getMovieCountWithFilter() -> Int {
        if searchString.isEmpty {
            return viewModel.movies.count
        } else {
            return viewModel.movies.filter { movie in
                movie.name.lowercased().contains(searchString.lowercased()) ||
                movie.genres.contains(searchString)
            }.count
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 20))
                    .foregroundStyle(.yellowTheme)
                TextField(
                    "",
                    text: $searchString,
                    prompt: Text("Search for a movie or genre...").foregroundStyle(.white.opacity(0.5))
                )
                    .frame(height: 30)
                    .font(
                        .custom("PTSans-Narrow", size: 23)
                    )
                    .containerRelativeFrame(.horizontal) { length, axis in
                        return length * 0.67
                    }
                    .background(.grayTheme)
                    .foregroundStyle(.white)
                    .focused($isTextFieldFocused)

                Image(systemName: "xmark")
                    .font(.system(size: 25))
                    .foregroundStyle(.yellowTheme)
                    .opacity(searchString == "" ? 0 : 1)
                    .onTapGesture {
                        searchString = ""
                    }
            }
            .frame(height: 40)
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.90
            }
            .background(
                // --- Top Layer: The button itself ---
                RoundedRectangle(cornerRadius: 25)
                    .fill(.grayTheme)
                    .overlay(
                        // Add the thin black border
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.black, lineWidth: 0.5)
                    )
            )
            .padding(.top, 20)
            
            DisclosureGroup {
                HStack {
                    Spacer()
                    DataView(isShowingSheet: $isShowingSheet, movies: $viewModel.movies)
                    Spacer()
                }
            } label: {
                HStack {
                    Text("Total Movies: \(getMovieCountWithFilter())")
                        .padding(.leading, 20)
                        .font(
                            .custom("Poppins-Bold", size: 25)
                        )
                        .foregroundStyle(.blueButtonTheme)
                    Spacer()
                }
                .padding(.top, 5)

            }
            .padding(.trailing, 15)
           
            Divider()
                .frame(height: 3)
                .overlay(.black)
                .padding(.top, -5)
            VStack {
               // ScrollView {
                    List(viewModel.movies, id: \.id) { movie in
                        if searchString == "" ||
                            movie.name.lowercased().contains(searchString.lowercased()) ||
                            movie.genres.contains(searchString)
                        {
                            MovieView(movie: movie)
                                .listRowBackground(Color.grayTheme)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets())
                                .padding(.bottom, 10)

                        }
                    }
                    .padding(.bottom, 5)
                    //.padding(.top, -10)
                    .scrollContentBackground(.hidden)
                    .refreshable {
                        Task {
                            try await viewModel.getAllMovies()
                        }
                    }
                    .listRowSpacing(0)
            }
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.94
            }
            .frame(maxHeight: .infinity)
            .onAppear {
                Task {
                    try await viewModel.getAllMovies()
                }
            }
            .padding(.top, -10)

        }
        .cornerRadius(20)
        .background(
            // --- Top Layer: The button itself ---
            RoundedRectangle(cornerRadius: 20)
                .fill(.grayTheme)
                .overlay(
                    // Add the thin black border
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.black, lineWidth: 3)
                )
        )
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.black)
            }
            // The magic offsets:
                .offset(x: 0, y: 4)  // Slightly right, heavily down
                .scaleEffect(x: 0.99, y: 1.0)
        )
        //.padding(5)
        .padding(.top, isTextFieldFocused ? 80 : 0)
        .onAppear {
            isShowingSheet = false
        }
        Spacer()
    }
}

#Preview {
    MovieListView()
}
