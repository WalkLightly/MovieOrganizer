//
//  SettingsView.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/3/26.
//

import SwiftUI

struct FolderLoc: Hashable {
    var id: String
    var name: String
}

struct SettingsView: View {

    @State var editingId: String = ""
    @State var newFolderName: String = ""
    @State var newGenreName: String = ""
    @State var newGenreAbbreviation: String = ""
    @StateObject private var viewModel = SettingsViewModel()
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
                            if !viewModel.folders.isEmpty {
                                
                                ForEach(viewModel.folders, id: \.self) { folder in
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
                                            .frame(width: 160)
                                            .background(.blueTheme)
                                            .cornerRadius(10)
                                            
                                        } else {
                                            HStack {
                                                Text(folder.name)
                                                    .font(
                                                        .custom(
                                                            "Poppins-Bold",
                                                            size: 40
                                                        )
                                                    )
                                                    .foregroundStyle(.black)
                                                    .padding(.leading, 10)
                                                
                                                
                                                Spacer()
                                            }
                                            .frame(width: 160)
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
                                                                    size: 18
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
                                                                    size: 18
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
                                    .overlay(alignment: .bottom) {
                                        Rectangle()
                                            .frame(height: 1) // This sets the thickness of your border
                                            .foregroundColor(.black.opacity(0.1)) // This sets the border color
                                    }
                                }
                                .ignoresSafeArea(.container, edges: .top)
                            }
                        }
                        .frame(height: 350)
                    } label: {
                        Text("Edit Folders")
                            .font(.custom("Poppins-Bold", size: 25))
                            .foregroundStyle(.blueTheme)
                            .padding(.leading, 10)

                    }
                    .padding()
                }
                .background(
                    // --- Top Layer: The button itself ---
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.backgroundTheme.opacity(0.6))

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
                           if !viewModel.genres.isEmpty {
                               ForEach(viewModel.genres, id: \.self) { genre in
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
                                                   .frame(width: 200)
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
                                                   .frame(width: 200)
                                                   .background(.blueTheme)
                                                   .cornerRadius(10)
                                               }
                                               .padding(8)
                                           }
                                           .background(.blueTheme.opacity(0.7))
                                           .cornerRadius(15)
                                           .padding(.bottom, isTextFieldFocused && editingId == genre.id ? 80 : 0)

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
                                                       .foregroundStyle(.black)
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
                                           .frame(width: 200)
                                           
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
                                                                size: 18
                                                            )
                                                           )
                                                       
                                                           .foregroundStyle(.black)
                                                           .padding(
                                                            .horizontal,
                                                            10
                                                           )
                                                           .padding(.vertical, 5)
                                                   }
                                                   .frame(width: 75, height: 50)
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
                                                                size: 18
                                                            )
                                                           )
                                                           .foregroundStyle(.black)
                                                           .padding(
                                                            .horizontal,
                                                            10
                                                           )
                                                           .padding(.vertical, 5)
                                                   }
                                                   .frame(width: 75, height: 50)
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
                                               .padding(.bottom, isTextFieldFocused && editingId == genre.id ? 80 : 0)

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
                                   .overlay(alignment: .bottom) {
                                       Rectangle()
                                           .frame(height: 1) // This sets the thickness of your border
                                           .foregroundColor(.black.opacity(0.1)) // This sets the border color
                                   }
                               }
                            }
                        }
                        .frame(height: 350)
                    } label: {
                        Text("Edit Genres")
                            .font(.custom("Poppins-Bold", size: 25))
                            .foregroundStyle(.blueTheme)
                            .padding(.leading, 10)

                    }
                    .padding()
                }
                .background(
                    // --- Top Layer: The button itself ---
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.backgroundTheme.opacity(0.6))
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
                .padding(.bottom, 15)
                
                //.cornerRadius(10)
                //.background(.blueButtonTheme)
            }
            .ignoresSafeArea()
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.9
            }
            .padding(.top, 15)
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
        .background(
            // --- Top Layer: The button itself ---
            RoundedRectangle(cornerRadius: 10)
                .fill(.grayTheme)
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
                .offset(x: 0, y: 4)
                .scaleEffect(x: 0.99, y: 1.0)
        )
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
