//
//  EditMovieSheet.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/16/26.
//

import SwiftUI

struct EditMovieSheet: View {
    
    @Binding var selectedMovie: Movie
    @Binding var showSheet: Bool
    
    @State var newGenre: String = ""
    @State private var formColor: Color = .seafoamBlue
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Name")
                    .foregroundStyle(formColor)
                    .font(
                        .custom(
                            "PTSans-Narrow",
                            size: 25
                        )
                    )
                TextField("", text: $selectedMovie.name, axis: .vertical)
                    .lineLimit(3, reservesSpace: true)
                    .containerRelativeFrame(.horizontal) { length, axis in
                        return length * 0.78
                    }
                    .frame(height: 40)
                    .foregroundStyle(.white)
                    .font(.custom("PTSans-Narrow", size: 25))
                    .padding(.leading, 5)
                    .padding(.top, 5)
                    .focused($isTextFieldFocused)

                Rectangle()
                    .fill(formColor)
                    .frame(height: 2)
                    .containerRelativeFrame(.horizontal) { length, axis in
                        return length * 0.78
                    }
                    .offset(y: -5)
            }
            HStack {
                Text("Type:")
                    .font(
                        .custom(
                            "PTSans-Narrow",
                            size: 25
                        )
                    )
                    .padding(.vertical, 10)
                    .padding(.trailing, 50)
                    .foregroundStyle(formColor)
                ZStack {
                    Rectangle()
                        .fill(.grayTheme)
                        .border(.seafoamBlue, width: 2)
                        .cornerRadius(5)
                        .frame(width: 50, height: 47)
                        .offset(x: selectedMovie.type == "DVD" ? -41.5 : 41)
                    HStack {
                        VStack {
                            Button {
                                withAnimation(.smooth(duration: 0.4, extraBounce: 0.3)) {
                                    selectedMovie.type = "DVD"
                                }
                            } label: {
                                Image(systemName: "opticaldisc.fill").foregroundStyle(.yellowTheme)
                                    .font(.system(size: 30, weight: .black))
                                    .padding(4)
                            }
                            .cornerRadius(5)
                            .padding(5)
                        }
                        .padding(.trailing, 20)
                        VStack {
                            Button {
                                withAnimation(.smooth(duration: 0.4, extraBounce: 0.3)) {
                                    selectedMovie.type = "VHS"
                                }
                            } label: {
                                Text("VHS")
                                    .font(
                                        .custom(
                                            "PTSans-Narrow",
                                            size: 25
                                        )
                                    )
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 10)
                                    .foregroundStyle(.yellowTheme)
                            }
                            .cornerRadius(5)
                        }
                    }
                }
                Spacer()
            }
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.8
            }
            HStack {
                Text("Cable Recording:")
                    .font(
                        .custom(
                            "PTSans-Narrow",
                            size: 25
                        )
                    )
                    .padding(.vertical, 10)
                    .padding(.trailing, 50)
                    .foregroundStyle(formColor)
                Button {
                    withAnimation(.smooth(duration: 0.2)) {
                        selectedMovie.isCableRecording.toggle()
                    }
                } label: {
                    Text(" ")
                }
                .frame(width: 30, height: 30)
                .border(.yellowTheme, width: 2)
                .cornerRadius(2)
                .padding(.leading, 20)
                Button {
                    withAnimation(.smooth(duration: 0.3)) {
                        selectedMovie.isCableRecording.toggle()
                    }
                } label: {
                    Text(" ")
                }
                .frame(width: 20, height: 20)
                .background(.yellowTheme)
                .cornerRadius(2)
                .rotationEffect(Angle(degrees: selectedMovie.isCableRecording ? 90 : 0)) // Rotates the button by 45 degrees
                .offset(x: -33)
                .opacity(selectedMovie.isCableRecording ? 1 : 0)
                Spacer()
            }
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.8
            }
            HStack {
                VStack {
                    HStack {
                        Text("Genres")
                            .foregroundStyle(formColor)
                            .font(.custom("PTSans-Narrow", size: 25))
                        Spacer()
                    }
                    HStack {
                        TextField("", text: $newGenre)
                            .frame(height: 40)
                            .foregroundStyle(.white)
                            .font(.custom("PTSans-Narrow", size: 25))
                        
                            .padding(.top, -18)
                            .containerRelativeFrame(.horizontal) { length, axis in
                                return length * 0.5
                            }
                        Spacer()
                    }
                       // .focused($showGenresAvailable)
                    HStack {
                        Rectangle()
                            .fill(formColor)
                            .frame(height: 2)
                            .containerRelativeFrame(.horizontal) { length, axis in
                                return length * 0.5
                            }
                            .opacity(0.7)
                            .offset(y: -5)
                        Spacer()
                    }
                }
                Button {
                    selectedMovie.genres.append(newGenre)
                    newGenre = ""
                } label: {
                    Text("Add")
                        .font(.custom("PTSans-Narrow", size: 30))
                        .frame(width: 90, height: 40)
                        .foregroundColor(newGenre == "" ? .gray : .yellowTheme)
                }
                .disabled(newGenre == "")

            }
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.8
            }
            HStack {
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 1) {
                        ForEach(selectedMovie.genres, id: \.self) { g in
                            VStack {
                                Text(g)
                                    .frame(height: 15)
                                    .font(.custom("Poppins-Bold", size: 15))
                                    .padding(10)
                                    .foregroundStyle(.white)
                                    .cornerRadius(10)
                                    .onTapGesture {
                                        selectedMovie.genres = selectedMovie.genres.filter { $0 != g }
                                    }
                            }
                            .frame(height: 35)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.blueButtonTheme)
                                    .overlay(
                                        RoundedRectangle(
                                            cornerRadius: 15
                                        )
                                        .stroke(.black, lineWidth: 1)
                                    )
                            )
                            .background(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.black)
                                }
                                // The magic offsets:
                                .offset(x: 0, y: 2)  // Slightly right, heavily down
                                .scaleEffect(x: 0.99, y: 1.0)
                            )
                            .padding(.vertical, 20)
                            .padding(.leading, 8)
                        }
                    }
                }
                .frame(height: 60)
            }
            .padding(.horizontal, 15)
            HStack (spacing: 50) {
                VStack(alignment: .leading) {
                    Text("Folder")
                        .foregroundStyle(formColor)
                        .font(
                            .custom(
                                "PTSans-Narrow",
                                size: 25
                            )
                        )
                    TextField("", text: $selectedMovie.folder)
                        .containerRelativeFrame(.horizontal) { length, axis in
                            return length * 0.2
                        }
                        .frame(height: 40)
                        .foregroundStyle(.white)
                        .font(.custom("PTSans-Narrow", size: 25))
                        .padding(.leading, 5)
                        .padding(.top, -18)
                    Rectangle()
                        .fill(formColor)
                        .frame(height: 2)
                        .containerRelativeFrame(.horizontal) { length, axis in
                            return length * 0.2
                        }
                        .offset(y: -5)
                }
                VStack(alignment: .leading) {
                    Text("Spot")
                        .foregroundStyle(formColor)
                        .font(
                            .custom(
                                "PTSans-Narrow",
                                size: 25
                            )
                        )
                    TextField("", text: $selectedMovie.location)
                        .containerRelativeFrame(.horizontal) { length, axis in
                            return length * 0.2
                        }
                        .frame(height: 40)
                        .foregroundStyle(.white)
                        .font(.custom("PTSans-Narrow", size: 25))
                        .padding(.leading, 5)
                        .padding(.top, -18)
                    Rectangle()
                        .fill(formColor)
                        .frame(height: 2)
                        .containerRelativeFrame(.horizontal) { length, axis in
                            return length * 0.2
                        }
                        .offset(y: -5)
                }
                Spacer()
            }
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.8
            }

            Button {
            } label: {
                Text("Add Movie")
                    .font(
                        .custom(
                            "PTSans-Narrow",
                            size: 25
                        )
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, 10)
                    .foregroundStyle(.black)
                    .containerRelativeFrame(.horizontal) { length, axis in
                        return length * 0.8
                    }

            }
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.8
            }
            .background(
                // --- Top Layer: The button itself ---
                RoundedRectangle(cornerRadius: 15)
                    .fill(.blueButtonTheme)
                    .overlay(
                        // Add the thin black border
                        RoundedRectangle(
                            cornerRadius: 15
                        )
                        .stroke(.black, lineWidth: 1)
                    )
            )
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.black)
                }
                // The magic offsets:
                .offset(x: 0, y: 2)  // Slightly right, heavily down
                .scaleEffect(x: 0.99, y: 1.0)
            )
            .padding(.top, 40)
            Spacer()
            
        }
        .containerRelativeFrame(.horizontal) { length, axis in
            return length * 0.9
        }
        .containerRelativeFrame(.vertical) { length, axis in
            return length * 0.8
        }
        .padding(.top, isTextFieldFocused ? 100 : 0)
    }
}

#Preview {
    EditMovieSheet(selectedMovie: .constant(Movie(id: "Ld", isCableRecording: false, name: "Jack Reacher", genres: [], folder: "", location: "", type: "")), showSheet: .constant(true))
}
