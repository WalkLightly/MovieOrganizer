//
//  AddItem.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/11/26.
//

import SwiftUI

struct AddItem: View {
    
    @Binding var chosenItem: String
    @State private var formColor: Color = .seafoamBlue
    
    // folder
    @State private var folderName: String = ""
    
    // genre
    @State private var genreName: String = ""
    @State private var genreAbbreviation: String = ""
    
    // movie
    @State private var movieGenres: [String] = []
    @State private var movieGenre: String = ""
    @State private var movieFolder: String = ""
    @State private var location: String = ""
    @State private var isCableRecording: Bool = false
    @State private var movieName: String = ""
    @State private var type: String = "DVD"
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Color(.black.opacity(0.5))
            }
            //.padding(.bottom, 470)
            .frame(height: 1500)
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 1
            }
            VStack {
                Spacer()
                if chosenItem == "Movie" {
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
                            TextField("", text: $movieName, axis: .vertical)
                                .containerRelativeFrame(.horizontal) { length, axis in
                                    return length * 0.78
                                }
                                .frame(height: 40)
                                .foregroundStyle(.white)
                                .font(.custom("PTSans-Narrow", size: 25))
                                .padding(.leading, 5)
                                .padding(.top, -18)
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
                                    .offset(x: type == "DVD" ? -41.5 : 41)
                                HStack {
                                    VStack {
                                        Button {
                                            withAnimation(.smooth(duration: 0.4, extraBounce: 0.3)) {
                                                type = "DVD"
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
                                                type = "VHS"
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
                                    isCableRecording.toggle()
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
                                    isCableRecording.toggle()
                                }
                            } label: {
                                Text(" ")
                            }
                            .frame(width: 20, height: 20)
                            .background(.yellowTheme)
                            .cornerRadius(2)
                            .rotationEffect(Angle(degrees: isCableRecording ? 90 : 0)) // Rotates the button by 45 degrees
                            .offset(x: -33)
                            .opacity(isCableRecording ? 1 : 0)
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
                                    TextField("", text: $movieGenre)
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
                                movieGenres.append(movieGenre)
                                movieGenre = ""
                            } label: {
                                Text("Add")
                                    .font(.custom("PTSans-Narrow", size: 30))
                                    .frame(width: 90, height: 40)
                                    .foregroundColor(movieGenre == "" ? .gray : .yellowTheme)
                            }
                            .disabled(movieGenre == "")

                        }
                        .containerRelativeFrame(.horizontal) { length, axis in
                            return length * 0.8
                        }
                        HStack {
                            ScrollView(.horizontal, showsIndicators: true) {
                                HStack(spacing: 1) {
                                    ForEach(movieGenres, id: \.self) { g in
                                        VStack {
                                            Text(g)
                                                .frame(height: 15)
                                                .font(.custom("Poppins-Bold", size: 15))
                                                .padding(10)
                                                .foregroundStyle(.white)
                                                .cornerRadius(10)
                                                .onTapGesture {
                                                    movieGenres = movieGenres.filter { $0 != g }
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
                                TextField("", text: $movieFolder)
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
                                TextField("", text: $location)
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
                    }
                    .containerRelativeFrame(.horizontal) { length, axis in
                        return length * 0.9
                    }
                    .containerRelativeFrame(.vertical) { length, axis in
                        return length * 0.8
                    }
                    .background(.grayTheme)
                    .transition(
                        .move(edge: .leading).combined(with: .opacity)
                    )
                    .cornerRadius(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                        .shadow(
                            color: .white.opacity(0.9),
                            radius: 4,
                            x: 0,
                            y: 0
                        )
                    )
                    .padding(.top, isTextFieldFocused ? 100 : 0)
                  
                } else if chosenItem == "Folder" {
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
                            TextField("", text: $folderName)
                                .containerRelativeFrame(.horizontal) { length, axis in
                                    return length * 0.78
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
                                    return length * 0.78
                                }
                                .offset(y: -5)
                        }
                        Button {
                            print("clicked")
                        } label: {
                            Text("Add Folder")
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
                        .padding(.top, 30)
                    }
                    .containerRelativeFrame(.horizontal) { length, axis in
                        return length * 0.9
                    }
                    .containerRelativeFrame(.vertical) { length, axis in
                        return length * 0.27
                    }
                    .background(.grayTheme)
                    .transition(
                        .move(edge: .leading).combined(with: .opacity)
                    )
                    .cornerRadius(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                        .shadow(
                            color: .white.opacity(0.9),
                            radius: 4,
                            x: 0,
                            y: 0
                        )
                    )
                } else {
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
                            TextField("", text: $genreName)
                                .containerRelativeFrame(.horizontal) { length, axis in
                                    return length * 0.78
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
                                    return length * 0.78
                                }
                                .offset(y: -5)
                        }
                        VStack(alignment: .leading) {
                            Text("Abbreviation")
                                .foregroundStyle(formColor)
                                .font(
                                    .custom(
                                        "PTSans-Narrow",
                                        size: 25
                                    )
                                )
                            TextField("", text: $genreAbbreviation)
                                .containerRelativeFrame(.horizontal) { length, axis in
                                    return length * 0.78
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
                                    return length * 0.78
                                }
                                .offset(y: -5)
                        }
                        Button {
                        } label: {
                            Text("Add Genre")
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
                        .padding(.top, 30)

                    }
                    .containerRelativeFrame(.horizontal) { length, axis in
                        return length * 0.9
                    }
                    .containerRelativeFrame(.vertical) { length, axis in
                        return length * 0.4
                    }
                    .background(.grayTheme)
                    .transition(
                        .move(edge: .leading).combined(with: .opacity)
                    )
                    .cornerRadius(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                        .shadow(
                            color: .white.opacity(0.9),
                            radius: 4,
                            x: 0,
                            y: 0
                        )
                    )
                }
            }
            .containerRelativeFrame(.vertical) { length, axis in
                return length * 0.5
            }
            .padding(.top, chosenItem == "Movie" ? -40 : 200)
        }
        .onAppear {
            genreName = ""
            genreAbbreviation = ""
            folderName = ""
        }
    }
}

#Preview {
    AddItem(chosenItem: .constant("Movie"))
}
