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
                        .custom("PTSans-Narrow", size: 25)
                    )
                    .foregroundStyle(.blueTheme)
                    .padding(.leading, 10)
                    .padding(.bottom, 8)
                    .padding(.top, -5)
                Spacer()
            }
            HStack {
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: -3) {
                        ForEach(movie.genres, id: \.self) { genre in
                            VStack {
                                Text(genre)
                                    .font(
                                        .custom("Poppins-Bold", size: 12)
                                    )
                                    .foregroundStyle(.black)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 3)
                            }
                            .background(
                                // --- Top Layer: The button itself ---
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.seafoamBlue)
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
                                    .offset(x: 0, y: 2)  // Slightly right, heavily down
                                    .scaleEffect(x: 1.0, y: 1.0)
                            )
                            .padding(.top, 3)
                        }
                        .padding(.trailing, 5)
                        .padding(.bottom, 5)
                        .padding(.leading, 3)
                    }
                }
                .containerRelativeFrame(.horizontal) { length, axis in
                    return length * 0.73
                }
                HStack {
                    ZStack {
                        Image(systemName: "folder.fill")
                            .foregroundStyle(.blueButtonTheme)
                            .font(.system(size: 35))
                        Text("\(movie.folder)\(movie.location)")
                            .font(.custom("PTSans-Narrow", size: 15))
                            .padding(.horizontal, 10)
                            .foregroundStyle(.white)
                    }
                    Spacer()
                }
                //Spacer()
                
                
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
    MovieView(movie: Movie.init(id: "1", isCableRecording: false, name: "What if it is a really long one for this movie", genres: ["Fantasy/Fitness", "Horror"], folder: "H", location: "23", type: ""))
}
