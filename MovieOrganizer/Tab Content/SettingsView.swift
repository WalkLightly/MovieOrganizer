//
//  SettingsView.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/3/26.
//

import SwiftUI

struct Folder: Hashable {
    var id: Int
    var name: String
}

var folders: [Folder] = [
    Folder(id: 1, name: "A"),
    Folder(id: 2, name: "B"),
    Folder(id: 3, name: "C"),
    Folder(id: 4, name: "D"),
    Folder(id: 5, name: "E"),
    Folder(id: 6, name: "F"),

]

struct SettingsView: View {

    @State var editingId: String = ""
    @State var newFolderName: String = ""
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
                                    if editingId == folder.name {
                                        VStack {
                                            TextField("", text: $newFolderName)
                                                .font(
                                                    .custom("PTSans-Narrow", size: 40)
                                                )
                                                .foregroundStyle(.white)
                                                .padding(.leading, 10)
                                                .padding(.vertical, 5)
                                                .focused($isTextFieldFocused)

                                        }.frame(width: 170)
                                            .background(.blueTheme)
                                            .cornerRadius(10)

                                    } else {
                                        Text(folder.name)
                                            .font(
                                                .custom("PTSans-Narrow", size: 40)
                                            )
                                            .foregroundStyle(.white)
                                            .padding(.leading, 10)
                                            .onTapGesture {
                                                editingId = folder.name
                                                newFolderName = folder.name
                                                isTextFieldFocused = true
                                            }
                                    }
                                    Spacer()
                                    HStack {
                                        if editingId == folder.name {
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
                                                .frame(width: 80)
                                                .background(.yellow)
                                                .cornerRadius(10)
                                                
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
                                                    .frame(width: 60)
                                                    .background(.seafoamBlue)
                                                    .cornerRadius(10)

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
                                        }
                                    }
                                    .frame(width: 80)
                                }
                            }
                        }
                        .frame(height: 200)
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
                        VStack {
                            Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed mauris sit amet ex finibus suscipit. Nullam dapibus pulvinar eros, eget fringilla enim finibus ac. Nunc tempor sem in vehicula placerat. Nam vitae fermentum nisl. Proin dictum ligula vel interdum hendrerit. Curabitur maximus sollicitudin vehicula. Maecenas vestibulum vehicula viverra. Mauris vel dolor lorem. Nullam felis nulla, cursus sit amet nunc nec, venenatis mollis risus. Integer ut semper purus, a ullamcorper sem. Proin mattis facilisis est at molestie. Morbi lobortis hendrerit sapien sed fringilla. In volutpat nec libero ut consequat. Fusce placerat lectus odio, ac facilisis dolor egestas ac. Vestibulum porta elit et porttitor tincidunt. Ut imperdiet consectetur nunc sit amet scelerisque. "
                            )
                        }
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
                    // The magic offsets:
                    .offset(x: 0, y: 6)  // Slightly right, heavily down
                    .scaleEffect(x: 1.0, y: 1.0)
                )
                .padding(.top, 10)
                //                .background(.blueButtonTheme)
                //                .cornerRadius(10)
            }
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
    }
}

#Preview {
    SettingsView()
}
