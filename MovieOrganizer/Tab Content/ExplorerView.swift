//
//  ExplorerView.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/10/26.
//

import SwiftUI

struct ExplorerView: View {
    
    @StateObject private var viewModel = ExplorerViewModel()
    @State var selectedFolder = Folder(id: "", name: "", movies: [])
    
    
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible()),
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    
    var body: some View {

        VStack {
            VStack {
                ScrollView {
                    
                    if !viewModel.folders.isEmpty {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(viewModel.folders, id: \.self) { folder in
                                ZStack {
                                    Image(systemName: "folder.fill")
                                        .foregroundStyle(.yellowTheme)
                                        .font(.system(size: 60))
                                    Text(folder.name)
                                        .font(.custom("PTSans-Narrow", size: 30))
                                        .padding(.horizontal, 10)
                                        .foregroundStyle(.blueTheme)
                                }
                                .onTapGesture {
                                    selectedFolder = folder
                                    selectedFolder.movies.sort { $0.spot < $1.spot }
                                }
                            }
                        }
                        .padding()
                        
                    }
                }
                .containerRelativeFrame(.horizontal) { length, axis in
                    return length * 0.90
                }
                .containerRelativeFrame(.vertical) { length, axis in
                    return length * 0.35
                }
                .padding(.bottom, 10)
            }
            .background(.grayTheme.opacity(0.2))
            .cornerRadius(10)
            .padding(.top, 10)
            
            HStack {
                HStack(spacing: 40) {
                    HStack(spacing: 0) {
                        Text("Selected Folder: ")
                            .font(.custom("Inder-Regular", size: 18))
                        Text(selectedFolder.name)
                            .font(.custom("Inder-Regular", size: 18))
                    }
                    
                    HStack(spacing: 0) {
                        Text("Total Movies: ")
                            .font(.custom("Inder-Regular", size: 18))
                        Text("\(selectedFolder.movies.count)")
                            .font(.custom("Inder-Regular", size: 18))
                    }
                    
                }
            }
            .padding(.horizontal, 2)
            .padding(.vertical, 10)
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.88
            }
            .background(
                // --- Top Layer: The button itself ---
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blueTheme)
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
            ScrollView {
                ForEach(selectedFolder.movies, id: \.self) { fm in
                    HStack {
                        VStack {
                            Text(fm.spot)
                                .font(.custom("Inder-Regular", size: 18))
                                .foregroundStyle(.black)
                                .padding(5)
                        }
                        .background(.seafoamBlue)
                        .cornerRadius(10)
                        Text(fm.name)
                            .font(.custom("Inder-Regular", size: 18))
                            .foregroundStyle(.black)
                        Spacer()
                    }
                    .padding(.leading, 10)
                    .padding(.bottom, 10)
//                    Text("\(selectedFolder.movies.count)")
//                        .font(.custom("Inder-Regular", size: 18))
                }
                .padding(.top, 10)
            }
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.90
            }
            .containerRelativeFrame(.vertical) { length, axis in
                return length * 0.3
            }
            .background(.grayTheme.opacity(0.2))
            .cornerRadius(10)

            Spacer()
        }
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
        .onAppear {
//            editingId = ""
//            newFolderName = ""
//            newGenreName = ""
//            newGenreAbbreviation = ""
        }
    }
}

#Preview {
    ExplorerView()
}
