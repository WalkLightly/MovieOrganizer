//
//  GenresAccordion.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/11/26.
//

import SwiftUI

struct GenresAccordionView: View {
    @State var editingId: String = ""
    @State var newGenreName: String = ""
    @State var newGenreAbbreviation: String = ""
    @StateObject private var viewModel = SettingsViewModel()

    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
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
            .frame(height: 400)
        } label: {
            Text("Edit Genres")
                .font(.custom("Poppins-Bold", size: 25))
                .foregroundStyle(.blueTheme)
                .padding(.leading, 10)
            
        }
        .padding()
    }
}

#Preview {
    GenresAccordionView()
}
