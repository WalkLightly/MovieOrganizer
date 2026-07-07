//
//  DataView.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/3/26.
//

import SwiftUI

struct DataView: View {
    @State private var isShowingSheet : Bool = true

    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Text("Your Top Genres")
                        .font(.custom("Poppins-Bold", size: 35))
                        .foregroundStyle(.offwhite)
                        .padding(.leading, 10)
                    Spacer()
                }
                VStack {
                    Text("Halloween")
                        .font(.custom("Poppins-Bold", size: 35))
                        .foregroundStyle(.seafoamBlue)
                        .padding(.top, 25)
                    Text("120")
                        .font(.custom("Poppins-Bold", size: 60))
                        .foregroundStyle(.yellowTheme.opacity(0.7))
                        .padding(.top, -30)
                    HStack {
                        Spacer()
                        Button {
                            isShowingSheet = true
                        } label: {
                            Text("View More")
                                .font(.custom("PTSans-Narrow", size: 25))
                                .foregroundStyle(.white)
                                .shadow(color: Color.black.opacity(0.4), radius: 1, x: 2, y: 3)
                            
                        }
                        .padding(.trailing, 10)
                        .padding(.top, -60)
                    }
                    
                }
                .containerRelativeFrame(.horizontal) { length, axis in
                    return length * 0.95
                }
                // height
                .containerRelativeFrame(.vertical) { length, axis in
                    return length * 0.27
                }
                .cornerRadius(10)
                .background(
                    // --- Top Layer: The button itself ---
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blueTheme)
                        .overlay(
                            // Add the thin black border
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 3)
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
                //   .shadow(color: Color.black.opacity(0.7), radius: 1, x: 2, y: 3)
                
                VStack {
                    HStack {
                        HStack {
                            VStack {
                                Text("Fantasy/Fitness")
                                    .font(.custom("PTSans-Narrow", size: 25))
                                    .foregroundStyle(.offwhite)
                                    .frame(width: 140, alignment: .leading)
                                Text("55")
                                    .font(.custom("Poppins-Bold", size: 40))
                                    .foregroundStyle(.yellowTheme)
                                //  .frame(width: 175, alignment: .leading)
                                    .frame(width: 140, alignment: .leading)
                            }
                            .padding(.leading, 10)
                            .onTapGesture {
                                //  previewBooks = viewModel.authors[1].books
                                isShowingSheet = true
                            }
                            Spacer()
                        }
                        
                        HStack {
                            VStack {
                                Text("Action")
                                    .font(.custom("PTSans-Narrow", size: 25))
                                    .foregroundStyle(.offwhite)
                                    .frame(width: 140, alignment: .leading)
                                Text("40")
                                    .font(.custom("Poppins-Bold", size: 40))
                                    .foregroundStyle(.yellowTheme)
                                //   .frame(width: 175, alignment: .leading)
                                    .frame(width: 140, alignment: .leading)
                                
                            }
                            //.frame(width: 175)
                            .padding(.leading, 10)
                            .onTapGesture {
                                // previewBooks = viewModel.authors[2].books
                                isShowingSheet = true
                            }
                            Spacer()
                        }
                    }
                    .padding(.top, -10)
                    .padding(.bottom, 20)
                    HStack {
                        HStack {
                            
                            VStack {
                                Text("Christmas")
                                    .font(.custom("PTSans-Narrow", size: 25))
                                    .foregroundStyle(.offwhite)
                                    .frame(width: 140, alignment: .leading)
                                // .frame(width: 175, alignment: .leading)
                                Text("34")
                                    .font(.custom("Poppins-Bold", size: 40))
                                    .foregroundStyle(.yellowTheme)
                                    .frame(width: 140, alignment: .leading)
                                
                            }
                            // .frame(width: 175)
                            .padding(.leading, 10)
                            .onTapGesture {
                                //  previewBooks = viewModel.authors[3].books
                                isShowingSheet = true
                            }
                            Spacer()
                        }
                        HStack {
                            VStack {
                                Text("Fantasy/Fitness")
                                    .font(.custom("PTSans-Narrow", size: 25))
                                    .foregroundStyle(.offwhite)
                                    .frame(width: 140, alignment: .leading)
                                Text("20")
                                    .font(.custom("Poppins-Bold", size: 40))
                                    .foregroundStyle(.yellowTheme)
                                    .frame(width: 140, alignment: .leading)
                                
                            }
                            .padding(.leading, 10)
                            .onTapGesture {
                                //  previewBooks = viewModel.authors[4].books
                                isShowingSheet = true
                            }
                            Spacer()
                        }
                        .containerRelativeFrame(.horizontal) { length, axis in
                            return length * 0.5
                        }
                    }
                }
                .containerRelativeFrame(.horizontal) { length, axis in
                    return length * 0.95
                }
                // height
                .containerRelativeFrame(.vertical) { length, axis in
                    return length * 0.40
                }
                .background(.blueButtonTheme)
                .cornerRadius(10)
                // .shadow(color: Color.black.opacity(0.7), radius: 2, x: 3, y: 3)
                .background(
                    // --- Top Layer: The button itself ---
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blueButtonTheme)
                        .overlay(
                            // Add the thin black border
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 8)
                        )
                )
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.black)
                    }
                    // The magic offsets:
                        .offset(x: 0, y: 6)  // Slightly right, heavily down
                        .scaleEffect(x: 0.99, y: 1.0)
                )
                .padding(.top, 10)
                VStack {
                    HStack {
                        Text("Other Genres")
                            .font(.custom("Poppins-Bold", size: 25))
                            .foregroundStyle(.black)
                            .padding(.leading, 10)
                        Spacer()
                    }
                }
                
            }
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.9
            }
            
        }
        .background(.backgroundTheme)
        .cornerRadius(10)
        .containerRelativeFrame(.horizontal) { length, axis in
            return length * 0.94
        }
        // height
        .containerRelativeFrame(.vertical) { length, axis in
            return length * 0.8
        }
        .background(
            // --- Top Layer: The button itself ---
            RoundedRectangle(cornerRadius: 10)
                .fill(.backgroundTheme)
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
        .sheet(isPresented: $isShowingSheet)
        {
            [isShowingSheet] in
            ScrollView {
                ForEach(genres, id: \.self) { genre in
                    Text("\(genre.name)")
                        .font(.custom("PTSans-Narrow", size: 25))
                        .foregroundStyle(.white)
                        .frame(width: 400, alignment: .leading)
                        .padding(.bottom, 15)
                        .padding(.leading, 15)
                    
                }
            }
            .presentationDetents([.height(500)])
            .padding(.top, 20)
            .padding(.leading, 20)
        }
        .onAppear {
            isShowingSheet = false
        }
    }
}

#Preview {
    DataView()
}
