//
//  SettingsView.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/3/26.
//

import SwiftUI

struct Folder: Hashable {
    var id: String
    var name: String
}
//A       Action
//B       don’t know what I had planned for that
//C       Comedy
//D       Drama
//F        Fantasy/Fitness
//H       Horror
//L        LDS
//M      Musical
//R       Romance
//S        Sci-Fi
//HA     Halloween
//TH     Thanksgiving
//CM    Christmas

var folders: [Folder] = [
    Folder(id: "1", name: "A"),
    Folder(id: "2", name: "B"),
    Folder(id: "3", name: "C"),
    Folder(id: "4", name: "D"),
    Folder(id: "5", name: "E"),
    Folder(id: "6", name: "F"),
]

struct Genre: Hashable {
    var id: String
    var name: String
    var abbreviation: String
}

var genres: [Genre] = [
    Genre(id: "7", name: "Action", abbreviation: "A"),
    Genre(id: "8", name: "Unknown", abbreviation: "B"),
    Genre(id: "9", name: "Comedy", abbreviation: "C"),
    Genre(id: "10", name: "Drama", abbreviation: "D"),
    Genre(id: "11", name: "Fantasy/Fitness", abbreviation: "F"),
    Genre(id: "12", name: "Horror", abbreviation: "H"),
    Genre(id: "13", name: "LDS", abbreviation: "L"),
    Genre(id: "14", name: "Musical", abbreviation: "M"),
    Genre(id: "15", name: "Romance", abbreviation: "R"),
    Genre(id: "16", name: "Sci-Fi", abbreviation: "S"),
    Genre(id: "17", name: "Halloween", abbreviation: "HA"),
    Genre(id: "18", name: "Thanksgiving", abbreviation: "TM"),
    Genre(id: "19", name: "Christmas", abbreviation: "CM"),
]

struct SettingsView: View {

    @State var editingId: String = ""
    @State var newFolderName: String = ""
    @State var newGenreName: String = ""
    @State var newGenreAbbreviation: String = ""

    @FocusState private var isTextFieldFocused: Bool

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    DisclosureGroup {
                        HStack {
                            Text("Tap folder name to edit")
                                .font(
                                    .custom("PTSans-Narrow", size: 20)
                                )
                                .foregroundStyle(.black.opacity(0.6))
                                .padding(.leading, 15)
                            Spacer()
                        }
                        ScrollView {
                            ForEach(folders, id: \.self) { folder in
                                HStack {
                                    if editingId == folder.id {
                                        VStack {
                                            TextField("", text: $newFolderName)
                                                .font(
                                                    .custom(
                                                        "PTSans-Narrow",
                                                        size: 40
                                                    )
                                                )
                                                .foregroundStyle(.white)
                                                .padding(.leading, 10)
                                                .padding(.vertical, 5)
                                                .focused($isTextFieldFocused)

                                        }
                                        .frame(width: 170)
                                        .background(.blueTheme)
                                        .cornerRadius(10)

                                    } else {
                                        HStack {
                                            Text(folder.name)
                                                .font(
                                                    .custom(
                                                        "PTSans-Narrow",
                                                        size: 40
                                                    )
                                                )
                                                .foregroundStyle(.white)
                                                .padding(.leading, 10)
                                                
                                                
                                            Spacer()
                                        }
                                        .frame(width: 170)
                                        .onTapGesture {
                                            editingId = folder.id
                                            newFolderName = folder.name
                                            isTextFieldFocused = true
                                        }
                                    }
                                    Spacer()
                                    HStack {
                                        if editingId == folder.id {
                                            HStack {
                                                Button {
                                                    editingId = ""
                                                } label: {
                                                    Text("CANCEL")
                                                        .font(
                                                            .custom(
                                                                "PTSans-Narrow",
                                                                size: 20
                                                            )
                                                        )

                                                        .foregroundStyle(.black)
                                                        .padding(
                                                            .horizontal,
                                                            10
                                                        )
                                                        .padding(.vertical, 5)
                                                }
                                                .frame(width: 80, height: 60)
                                                .background(.yellowTheme)
                                                .cornerRadius(10)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .fill(.seafoamBlue)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 10)
                                                                .stroke(.black, lineWidth: 2)
                                                        )
                                                )
                                                .background(
                                                    ZStack {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .fill(.black)
                                                    }
                                                    .offset(x: 0, y: 3)
                                                    .scaleEffect(x: 1.0, y: 1.0)
                                                )

                                                Button {

                                                } label: {
                                                    Text("SAVE")
                                                        .font(
                                                            .custom(
                                                                "PTSans-Narrow",
                                                                size: 20
                                                            )
                                                        )
                                                        .foregroundStyle(.black)
                                                        .padding(
                                                            .horizontal,
                                                            10
                                                        )
                                                        .padding(.vertical, 5)
                                                }
                                                .frame(width: 60, height: 60)
                                                .background(.seafoamBlue)
                                                .cornerRadius(10)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .fill(.seafoamBlue)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 10)
                                                                .stroke(.black, lineWidth: 2)
                                                        )
                                                )
                                                .background(
                                                    ZStack {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .fill(.black)
                                                    }
                                                    .offset(x: 0, y: 3)
                                                    .scaleEffect(x: 1.0, y: 1.0)
                                                )

                                            }
                                            .padding(.trailing, 70)
                                        } else {
                                            Button {

                                            } label: {
                                                Image(systemName: "trash")
                                                    .font(.system(size: 27))
                                                    .foregroundStyle(
                                                        .red.opacity(0.4)
                                                    )

                                            }
                                            .shadow(color: Color.black.opacity(0.4), radius: 1, x: 2, y: 3)
                                        }
                                    }
                                    .frame(width: 80)
                                }
                            }
                        }
                        .frame(height: 350)
                    } label: {
                        Text("Edit Folders")
                            .font(.custom("Poppins-Bold", size: 25))
                            .foregroundStyle(.yellowTheme)
                            .padding(.leading, 10)

                    }
                    .padding()
                }
                .background(
                    // --- Top Layer: The button itself ---
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blueButtonTheme)
                        .overlay(
                            // Add the thin black border
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 2)
                        )
                )
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.black)
                    }
                    // The magic offsets:
                    .offset(x: 0, y: 6)  // Slightly right, heavily down
                    .scaleEffect(x: 1.0, y: 1.0)
                )
                //.cornerRadius(10)
                .background(.blueButtonTheme)

                VStack {
                    DisclosureGroup {
                        HStack {
                            Text("Tap genre name to edit")
                                .font(
                                    .custom("PTSans-Narrow", size: 20)
                                )
                                .foregroundStyle(.black.opacity(0.6))
                                .padding(.leading, 15)
                            Spacer()
                        }
                        ScrollView {
                            ForEach(genres, id: \.self) { genre in
                                HStack {
                                    if editingId == genre.id {
                                        VStack {
                                            VStack {
                                                TextField(
                                                    "",
                                                    text: $newGenreName
                                                )
                                                .font(
                                                    .custom(
                                                        "PTSans-Narrow",
                                                        size: 25
                                                    )
                                                )
                                                .foregroundStyle(.white)
                                                .padding(.leading, 10)
                                                .padding(.vertical, 5)
                                                .focused($isTextFieldFocused)
                                                .frame(width: 230)
                                                .background(.blueTheme)
                                                .cornerRadius(10)
                                                TextField(
                                                    "",
                                                    text: $newGenreAbbreviation
                                                )
                                                .font(
                                                    .custom(
                                                        "PTSans-Narrow",
                                                        size: 25
                                                    )
                                                )
                                                .foregroundStyle(.white)
                                                .padding(.leading, 10)
                                                .padding(.vertical, 5)
                                                .focused($isTextFieldFocused)
                                                .frame(width: 230)
                                                .background(.blueTheme)
                                                .cornerRadius(10)
                                            }
                                            .padding(8)
                                        }
                                        .background(.blueTheme.opacity(0.7))
                                        .cornerRadius(15)
                                    } else {
                                        HStack {
                                            VStack {
                                                Text(genre.abbreviation)
                                                    .font(
                                                        .custom(
                                                            "PTSans-Narrow",
                                                            size: 25
                                                        )
                                                    )
                                                    .foregroundStyle(.black)
                                                    .padding(.horizontal, 10)
                                                    .padding(.vertical, 5)
                                            }
                                            .background(.seafoamBlue)
                                            .cornerRadius(10)
                                            .padding(.bottom, 10)
                                            HStack {
                                                Text(genre.name)
                                                    .font(
                                                        .custom(
                                                            "PTSans-Narrow",
                                                            size: 25
                                                        )
                                                    )
                                                    .foregroundStyle(.white)
                                                 //   .padding(.leading, 10)
                                                    .onTapGesture {
                                                        editingId = genre.id
                                                        newGenreName = genre.name
                                                        newGenreAbbreviation = genre.abbreviation
                                                        isTextFieldFocused = true
                                                    }
                                                Spacer()
                                            }

                                        }
                                        .frame(width: 250)
                                        .overlay(alignment: .bottom) {
                                            Rectangle()
                                                .frame(height: 1) // This sets the thickness of your border
                                                .foregroundColor(.gray.opacity(0.3)) // This sets the border color
                                        }
                                    }
                                    //Spacer()
                                    HStack {
                                        if editingId == genre.id {
                                            VStack {
                                                Button {
                                                    editingId = ""
                                                } label: {
                                                    Text("CANCEL")
                                                        .font(
                                                            .custom(
                                                                "PTSans-Narrow",
                                                                size: 20
                                                            )
                                                        )

                                                        .foregroundStyle(.black)
                                                        .padding(
                                                            .horizontal,
                                                            10
                                                        )
                                                        .padding(.vertical, 5)
                                                }
                                                .frame(width: 80, height: 50)
                                                .background(.yellowTheme)
                                                .cornerRadius(10)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .fill(.yellowTheme)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 10)
                                                                .stroke(.black, lineWidth: 2)
                                                        )
                                                )
                                                .background(
                                                    ZStack {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .fill(.black)
                                                    }
                                                    .offset(x: 0, y: 3)
                                                    .scaleEffect(x: 1.0, y: 1.0)
                                                )

                                                Button {

                                                } label: {
                                                    Text("SAVE")
                                                        .font(
                                                            .custom(
                                                                "PTSans-Narrow",
                                                                size: 20
                                                            )
                                                        )
                                                        .foregroundStyle(.black)
                                                        .padding(
                                                            .horizontal,
                                                            10
                                                        )
                                                        .padding(.vertical, 5)
                                                }
                                                .frame(width: 80, height: 50)
                                                .background(.seafoamBlue)
                                                .cornerRadius(10)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .fill(.seafoamBlue)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 10)
                                                                .stroke(.black, lineWidth: 2)
                                                        )
                                                )
                                                .background(
                                                    ZStack {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .fill(.black)
                                                    }
                                                    .offset(x: 0, y: 3)
                                                    .scaleEffect(x: 1.0, y: 1.0)
                                                )

                                            }
                                            //.padding(.trailing, 70)
                                        } else {
                                            Button {

                                            } label: {
                                                Image(systemName: "trash")
                                                    .font(.system(size: 27))
                                                    .foregroundStyle(
                                                        .red.opacity(0.4)
                                                    )

                                            }
                                            .shadow(color: Color.black.opacity(0.4), radius: 1, x: 2, y: 3)

                                        }
                                    }
                                    .frame(width: 80)
                                }
                            }
                        }
                        .frame(height: 400)
                    } label: {
                        Text("Edit Genres")
                            .font(.custom("Poppins-Bold", size: 25))
                            .foregroundStyle(.yellowTheme)
                            .padding(.leading, 10)

                    }
                    .padding()
                }
                .background(
                    // --- Top Layer: The button itself ---
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blueButtonTheme)
                        .overlay(
                            // Add the thin black border
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 2)
                        )
                )
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.black)
                    }
                    .offset(x: 0, y: 6)
                    .scaleEffect(x: 1.0, y: 1.0)
                )
                .padding(.top, 10)
                //.cornerRadius(10)
                //.background(.blueButtonTheme)
            }
            .ignoresSafeArea()
        }
        //  .background(.gray)
        .cornerRadius(10)
        .containerRelativeFrame(.horizontal) { length, axis in
            return length * 0.95
        }
        // height
        .containerRelativeFrame(.vertical) { length, axis in
            return length * 0.8
        }
        .onAppear {
            editingId = ""
            newFolderName = ""
            newGenreName = ""
            newGenreAbbreviation = ""
        }
    }
}

#Preview {
    SettingsView()
}
