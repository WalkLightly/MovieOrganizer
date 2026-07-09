//
//  DataView.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/3/26.
//

import SwiftUI

struct DataView: View {
    
    @StateObject private var viewModel = DataViewModel()
    @Binding var isShowingSheet: Bool
    @State private var previewGenres: [String] = []
    

    var body: some View {
        ZStack {
            VStack {
                Divider()
                    .frame(height: 2)
                    .overlay(.black)
                    .padding(.top, 2)
                ScrollView {
                    HStack {
                        Text("Genre Breakdown")
                            .font(.custom("Poppins-Bold", size: 30))
                            .foregroundStyle(.black)
                            .padding(.leading, 10)
                        Spacer()
                    }
                    .padding(.top, 20)
                    VStack {
                        if !viewModel.genres.isEmpty {
                            Text("\(viewModel.genres[0].name)")
                                .font(.custom("Poppins-Bold", size: 35))
                                .foregroundStyle(.seafoamBlue)
                                .padding(.top, 25)
                            Text("\(viewModel.genres[0].movies.count)")
                                .font(.custom("Poppins-Bold", size: 60))
                                .foregroundStyle(.yellowTheme.opacity(0.7))
                                .padding(.top, -40)
                        }
                        HStack {
                            Spacer()
                            Button {
                                previewGenres = viewModel.genres[0].movies
                                isShowingSheet = true
                            } label: {
                                Text("View More")
                                    .font(.custom("PTSans-Narrow", size: 25))
                                    .foregroundStyle(.white)
                                    .shadow(
                                        color: Color.black.opacity(0.4),
                                        radius: 1,
                                        x: 2,
                                        y: 3
                                    )
                                
                            }
                            .padding(.trailing, 10)
                            .padding(.top, -60)
                        }
                        
                    }
                    .padding(.horizontal, 3)
                    .containerRelativeFrame(.horizontal) { length, axis in
                        return length * 0.90
                    }
                    // height
                    .containerRelativeFrame(.vertical) { length, axis in
                        return length * 0.4
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
                        if !viewModel.genres.isEmpty {
                            HStack {
                                HStack {
                                    VStack {
                                        Text("\(viewModel.genres[1].name)")
                                            .font(.custom("PTSans-Narrow", size: 20))
                                            .foregroundStyle(.offwhite)
                                            .frame(width: 140, alignment: .leading)
                                        Text("\(viewModel.genres[1].movies.count)")
                                            .font(.custom("Poppins-Bold", size: 35))
                                            .foregroundStyle(.yellowTheme)
                                        //  .frame(width: 175, alignment: .leading)
                                            .frame(width: 140, alignment: .leading)
                                    }
                                    .padding(.leading, 30)
                                    .onTapGesture {
                                        previewGenres = viewModel.genres[1].movies
                                        isShowingSheet = true
                                    }
                                    Spacer()
                                }
                                
                                HStack {
                                    VStack {
                                        Text("\(viewModel.genres[2].name)")
                                            .font(.custom("PTSans-Narrow", size: 20))
                                            .foregroundStyle(.offwhite)
                                            .frame(width: 140, alignment: .leading)
                                        Text("\(viewModel.genres[2].movies.count)")
                                            .font(.custom("Poppins-Bold", size: 35))
                                            .foregroundStyle(.yellowTheme)
                                        //   .frame(width: 175, alignment: .leading)
                                            .frame(width: 140, alignment: .leading)
                                        
                                    }
                                    //.frame(width: 175)
                                    //.padding(.leading, 10)
                                    .onTapGesture {
                                        previewGenres = viewModel.genres[2].movies
                                        isShowingSheet = true
                                    }
                                    Spacer()
                                }
                            }
                            HStack {
                                HStack {
                                    
                                    VStack {
                                        Text("\(viewModel.genres[3].name)")
                                            .font(.custom("PTSans-Narrow", size: 20))
                                            .foregroundStyle(.offwhite)
                                            .frame(width: 140, alignment: .leading)
                                        // .frame(width: 175, alignment: .leading)
                                        Text("\(viewModel.genres[3].movies.count)")
                                            .font(.custom("Poppins-Bold", size: 35))
                                            .foregroundStyle(.yellowTheme)
                                            .frame(width: 140, alignment: .leading)
                                        
                                    }
                                    // .frame(width: 175)
                                    .padding(.leading, 30)
                                    .onTapGesture {
                                        previewGenres = viewModel.genres[3].movies
                                        isShowingSheet = true
                                    }
                                    Spacer()
                                }
                                HStack {
                                    VStack {
                                        Text("\(viewModel.genres[4].name)")
                                            .font(.custom("PTSans-Narrow", size: 20))
                                            .foregroundStyle(.offwhite)
                                            .frame(width: 140, alignment: .leading)
                                        Text("\(viewModel.genres[4].movies.count)")
                                            .font(.custom("Poppins-Bold", size: 35))
                                            .foregroundStyle(.yellowTheme)
                                            .frame(width: 140, alignment: .leading)
                                        
                                    }
                                    // .padding(.leading, 10)
                                    .onTapGesture {
                                        previewGenres = viewModel.genres[4].movies
                                        isShowingSheet = true
                                    }
                                    Spacer()
                                }
                                .containerRelativeFrame(.horizontal) { length, axis in
                                    return length * 0.40
                                }
                            }
                        }
                    }
                    .containerRelativeFrame(.horizontal) { length, axis in
                        return length * 0.90
                    }
                    // height
                    .containerRelativeFrame(.vertical) { length, axis in
                        return length * 0.44
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
                        VStack(alignment: .leading) {
                            ForEach(viewModel.genres.dropFirst(5)) { genre in
                                HStack {
                                    Text("\(genre.name)")
                                        .font(.custom("Poppins-Bold", size: 20))
                                        .foregroundStyle(.blueTheme)
                                        .frame(width: 245, alignment: .leading)
                                        .onTapGesture {
                                            isShowingSheet = true
                                            previewGenres = genre.movies
                                        }
                                    Text("\(genre.movies.count)")
                                        .font(.custom("Poppins-Bold", size: 23))
                                        .foregroundStyle(.white)
                                    Spacer()

                                }
                                
                                .padding(.leading, 20)
                                .frame(height: 30, alignment: .leading)
                            }
                            .padding(.top, 5)
                        }
                        
                    }
                    
                }
                .containerRelativeFrame(.horizontal) { length, axis in
                    return length * 0.9
                }
                
            }
            .background(.backgroundTheme)
            .padding(.trailing, 3)
            .cornerRadius(10)
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.92
            }
            // height
            .containerRelativeFrame(.vertical) { length, axis in
                return length * 0.6
            }
            //        .background(
            //            // --- Top Layer: The button itself ---
            //            RoundedRectangle(cornerRadius: 10)
            //                .fill(.backgroundTheme)
            //                .overlay(
            //                    // Add the thin black border
            //                    RoundedRectangle(cornerRadius: 10)
            //                        .stroke(.black, lineWidth: 2)
            //                )
            //        )
            //        .background(
            //            ZStack {
            //                RoundedRectangle(cornerRadius: 10)
            //                    .fill(.black)
            //            }
            //                .offset(x: 0, y: 4)
            //                .scaleEffect(x: 0.99, y: 1.0)
            //        )
            
            .sheet(isPresented: $isShowingSheet) {
                [isShowingSheet] in
                ScrollView {
                    ForEach(previewGenres, id: \.self) { gen in
                        Text("\(gen)")
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
        }
    }
}

#Preview {
    DataView(isShowingSheet: .constant(false))
}
