//
//  MovieView.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/5/26.
//

import SwiftUI

struct MovieView: View {
    @State var movie: Movie
    
    var body: some View {
        VStack(spacing: 1) {
            HStack {
                Text(movie.name)
                    .font(
                        .custom("Poppins-Bold", size: 20)
                    )
                    .foregroundStyle(.blueTheme)
                    .padding(10)
                Spacer()
            }
            HStack {
                ForEach(movie.genres, id: \.self) { genre in
                    VStack {
                        Text(genre)
                            .font(
                                .custom("PTSans-Narrow", size: 15)
                            )
                            .foregroundStyle(.black)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                    }
                    
                    .background(
                        // --- Top Layer: The button itself ---
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.seafoamBlue)
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
                        .offset(x: 0, y: 4)  // Slightly right, heavily down
                        .scaleEffect(x: 1.0, y: 1.0)
                    )
                }
                .padding(.trailing, 5)
                if movie.genres.count > 0 {
                    Divider()
                        .frame(height: 30)
                        .background(.black)
                }
                HStack {
                    ZStack {
                        Image(systemName: "folder.fill")
                            .foregroundStyle(.blueButtonTheme)
                            .font(.system(size: 40))
                        Text("B12")
                            .font(.custom("PTSans-Narrow", size: 20))
                            .padding(.horizontal, 10)
                            .foregroundStyle(.white)
                    }
                    Spacer()
                }
               Spacer()
            }
            .padding(.leading, 10)
            .padding(.bottom, 10)
            .padding(.top, -10)
        }
        .overlay(
            Rectangle()
                .fill(.blueTheme)
                .frame(height: 1), // Thickness of the border
            alignment: .bottom     // Pushes it to the very bottom
        )
    }
}

#Preview {
    MovieView(movie: Movie.init(id: "1", isCableRecording: false, name: "What if it is a really long one for this movie", genres: ["Fantasy/Fitness"], folder: "", location: "", type: ""))
}
