//
//  ImportExportView.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/20/26.
//

import SwiftUI
import UniformTypeIdentifiers

struct ImportExportView: View {
    @State private var isImporting: Bool = false
    @State private var selectedFileURL: URL?
    @State private var fileName: String = ""
    @State private var helpText: String = "You can download an excel copy of the current movie data in the database. You can also import an excel file containing movies and location data and it will be inserted into the database. If there are is any conflicting data, another view will appear prompting you to select which data is correct. Only then will the data be updated in the database"
    @State private var data: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Import/Export")
                    .font(.custom("Poppins-Bold", size: 35))
                    .foregroundStyle(.white)
                    .padding(.top, 10)
                    .padding(.leading, 15)
                Spacer()
            }
            if data == "" {
                VStack {
                    DisclosureGroup {
                        Text(helpText)
                            .font(.custom("PTSans-Narrow", size: 20))
                            .foregroundStyle(.white)
                            .padding(.leading, 15)
                            .padding(.vertical, 10)
                    } label: {
                        Text("Instructions")
                            .font(.custom("Poppins-Bold", size: 25))
                            .foregroundStyle(.yellowTheme)
                            .padding(.leading, 10)
                            .padding(.trailing, 20)
                    }
                    .containerRelativeFrame(.horizontal) { length, axis in
                        return length * 0.85
                    }
                    .background(.blueTheme)
                }
                .containerRelativeFrame(.horizontal) { length, axis in
                    return length * 0.9
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blueTheme)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 1)
                        )
                )
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.black)
                    }
                        .offset(x: 0, y: 2)
                        .scaleEffect(x: 0.99, y: 1.0)
                )
            }
            VStack {
                if data == "" {
                    VStack(spacing: 20) {
                        HStack {
                            Spacer()
                            if let url = selectedFileURL {
                                Text("\(url.lastPathComponent)")
                            }
                            Divider()
                                .overlay(. yellowTheme)
                            
                            Button {
                                isImporting = true
                            } label: {
                                Text("Select file")
                                    .font(.custom("Poppins-Bold", size: 20))
                                    .foregroundStyle(.yellowTheme)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                            }
                        }
                        .padding(.trailing, 10)
                        .padding(.top, 10)
                        .frame(height: 30)
                    }
                    // 1. Attach the file importer
                    .fileImporter(
                        isPresented: $isImporting,
                        allowedContentTypes: [.item], // [.pdf], [.image], etc.
                        allowsMultipleSelection: false
                    ) { result in
                        // 2. Handle the result
                        switch result {
                        case .success(let urls):
                            if let fileURL = urls.first {
                                // Important: Security scope access
                                let gotAccess = fileURL.startAccessingSecurityScopedResource()
                                self.selectedFileURL = fileURL
                                print("File selected at: \(fileURL)")
                                
                                // Always stop access when done
                                if gotAccess { fileURL.stopAccessingSecurityScopedResource() }
                            }
                        case .failure(let error):
                            print("Error picking file: \(error.localizedDescription)")
                        }
                    }
                    Button {
                        data = "test"
                    } label: {
                        Text("Upload to database")
                            .font(.custom("Poppins-Bold", size: 20))
                            .foregroundStyle(.black)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                    }
                    .containerRelativeFrame(.horizontal) { length, axis in
                        return length * 0.75
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.seafoamBlue)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 1)
                            )
                    )
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.black)
                        }
                            .offset(x: 0, y: 2)
                            .scaleEffect(x: 0.99, y: 1.0)
                    )
                    .padding(.top, 10)
                } else {
                    HStack {
                        Rectangle()
                            .fill(.yellowTheme)
                            .frame(width: 10)
                            .padding(.leading, 10)
                            .padding(.top, -15)
                            .containerRelativeFrame(.vertical) { length, axis in
                                return length * 0.1
                            }
                        Text("Tap which side you want to accept. The side with the yellow box around it will be saved to the database after clicking accept")
                            .font(.custom("Poppins-Bold", size: 15))
                            .foregroundStyle(.backgroundTheme)
                            .padding(.horizontal, 5)
                            .padding(.top, -15)
                            .containerRelativeFrame(.vertical) { length, axis in
                                return length * 0.1
                            }
                            
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                            data = ""
                        } label: {
                            Text("Cancel")
                                .font(.custom("Poppins-Bold", size: 15))
                                .foregroundStyle(.black)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.seafoamBlue)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: 1)
                                )
                        )
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.black)
                            }
                                .offset(x: 0, y: 2)
                                .scaleEffect(x: 0.99, y: 1.0)
                        )
                        Button {
                            data = ""
                        } label: {
                            Text("Accept")
                                .font(.custom("Poppins-Bold", size: 15))
                                .foregroundStyle(.black)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.seafoamBlue)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: 1)
                                )
                        )
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.black)
                            }
                                .offset(x: 0, y: 2)
                                .scaleEffect(x: 0.99, y: 1.0)
                        )
                    }
                    .padding(.trailing, 10)
                    .padding(.top, -15)
                    .padding(.bottom, 10)
                }
            }
            .frame(height: 100)
            
            ScrollView {
                if data != "" {
                    VStack {
                        HStack {
                            VStack {
                                Text("In Database")
                                    .font(.custom("Poppins-Bold", size: 20))
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                            }
                            .containerRelativeFrame(.horizontal) { length, axis in
                                return length * 0.45
                            }
                            Divider()
                                .frame(width: 2)
                            
                                .overlay(.white)
                                .padding(.top, -5)
                            VStack {
                                Text("From File")
                                    .font(.custom("Poppins-Bold", size: 20))
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                            }
                            .containerRelativeFrame(.horizontal) { length, axis in
                                return length * 0.45
                            }
                        }
                        .frame(height: 40)
                        .containerRelativeFrame(.horizontal) { length, axis in
                            return length * 0.9
                        }
                        Divider()
                            .frame(height: 2)
                            .overlay(. white)
                            .padding(.top, -5)
                    }
                } else {
                    VStack {
                        Spacer()
                        Text("Any issues found during importing will show up here")
                            .font(.custom("Poppins-Bold", size: 20))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                        Spacer()
                    }
                    .containerRelativeFrame(.vertical) { length, axis in
                        return length * 0.5
                    }
                }
            }
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.9
            }
            .background(.blueButtonTheme)
            .cornerRadius(10)
            .shadow(
                color: .white.opacity(0.9),
                radius: 4,
                x: 0,
                y: 0
            )
            Spacer()
            
        }
        .cornerRadius(10)
        .containerRelativeFrame(.horizontal) { length, axis in
            return length * 0.95
        }
        .containerRelativeFrame(.vertical) { length, axis in
            return length * 0.81
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.grayTheme)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 1)
                )
        )
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.black)
            }
                .offset(x: 0, y: 2)
                .scaleEffect(x: 0.99, y: 1.0)
        )
    }
}

#Preview {
    ImportExportView()
}
