//
//  HomeView.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 1/14/26.
//

import SwiftUI

struct HomeView: View {
    @State private var tab: String = "home"
    @State private var newItem = "Movie"
    @State private var xOffset = -145
    @State private var showShuffle: Bool = false
    @State private var randomGenre: String = ""
    @State private var showRandomlyChosenMovie: Bool = false
    @State private var randomMovie: String = ""
    
    @StateObject private var settingsViewModel = SettingsViewModel()
    
    func filteredMoviesByGenre() -> Genre {
        settingsViewModel.genres.first(where: { $0.name == randomGenre }) ?? Genre(id: "", name: "LDS", abbreviation: "", movies: [])
    }
    
    func getSlotOptions() -> [String] {
        return settingsViewModel.genres.map(\.name)
    }

    func getIcon() -> String {

        switch tab {
            case "home":
                return "house"
            case "search":
                return "magnifyingglass"
            case "file":
                return "arrow.up.arrow.down"
            case "history":
                return "clock.arrow.trianglehead.clockwise.rotate.90.path.dotted"
            case "settings":
                return "gear"
            default:
                return ""
        }

    }
    var body: some View {
        ZStack {
            Color(.blueTheme).ignoresSafeArea()
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [.white, .blueTheme],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: 400, height: 4000)
                .cornerRadius(20)
                .rotationEffect(.degrees(90))
                .offset(x: -200, y: -350)
            VStack {
                HStack {
                    HStack {
                        Text("Video Library")
                            .font(.custom("Poppins-Bold", size: 35))
                            .foregroundStyle(.white)
                            .shadow(
                                color: Color.black.opacity(0.9),
                                radius: 3,
                                x: 4,
                                y: 3
                            )

                        Spacer()
                        VStack {
                            Button(action: {
                                withAnimation(
                                    .smooth(duration: 0.3)
                                ) {
                                    //tab = "settings"
                                    //  xOffset = 116LD
                                }
                            }) {
                                Image(
                                    systemName:
                                        "arrow.trianglehead.2.clockwise.rotate.90.icloud.fill"
                                )
                                .font(.system(size: 20))
                                .foregroundStyle(.blueTheme)
                            }
                            .frame(width: 30, height: 30)
                            .cornerRadius(10)
                        }
                        .frame(width: 50, height: 50)
                        .background(.seafoamBlue)
                        .cornerRadius(15)
                        .background(
                            // --- Top Layer: The button itself ---
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.blueTheme)
                                .overlay(
                                    // Add the thin black border
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(.black, lineWidth: 2)
                                )
                        )
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.black)
                            }
                            // The magic offsets:
                            .offset(x: 0, y: 4)  // Slightly right, heavily down
                            .scaleEffect(x: 0.99, y: 1.0)
                        )
                        VStack {
                            Button(action: {
                                withAnimation(
                                    .smooth(duration: 0.6)
                                ) {
                                    showShuffle.toggle()
                                    randomGenre = ""
                                }
                            }) {
                                Image(
                                    systemName:
                                        "shuffle"
                                )
                                .font(.system(size: 20))
                                .foregroundStyle(.blueTheme)
                            }
                            .frame(width: 30, height: 30)
                            .cornerRadius(10)
                        }
                        .frame(width: 50, height: 50)
                        .background(.seafoamBlue)
                        .cornerRadius(15)
                        .background(
                            // --- Top Layer: The button itself ---
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.blueTheme)
                                .overlay(
                                    // Add the thin black border
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(.black, lineWidth: 2)
                                )
                        )
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.black)
                            }
                            // The magic offsets:
                            .offset(x: 0, y: 4)  // Slightly right, heavily down
                            .scaleEffect(x: 0.99, y: 1.0)
                        )
                    }
                    // width
                    .containerRelativeFrame(.horizontal) { length, axis in
                        return length * 0.95
                    }
                }
                .padding(.top, 60)
                .frame(width: 700, height: 100)

                // MAIN VIEW
                VStack {
                    if tab == "home" {
                        MovieListView()
                    } else if tab == "chart" {
                      //  DataView()
                    } else if tab == "settings" {
                        SettingsView()
                    } else if tab == "search" {
                        Spacer()
                        ExplorerView()
                    } else if tab == "newItem" {
                        AddItem(chosenItem: $newItem)
                    } else if tab == "file" {
                        ImportExportView()
                    }
                    Spacer()
                }
                .padding(.top, 20)

                // width
                .containerRelativeFrame(.horizontal) { length, axis in
                    return length * 0.95
                }
                // height
                .containerRelativeFrame(.vertical) { length, axis in
                    return length * 0.82
                }
                .overlay(alignment: .topTrailing) {
                    if showShuffle {
                        VStack {
                            VStack {
                                HStack {
                                    Text("Randomizer")
                                        .font(
                                            .custom("PTSans-Narrow", size: 40)
                                        )
                                        .foregroundStyle(.black)
                                    Spacer()
                                }
                                .padding(.top, 10)
                                HStack {
                                    Button {
                                        showRandomlyChosenMovie = true
                                    } label: {
                                        Text("Random Movie")
                                            .font(
                                                .custom(
                                                    "PTSans-Narrow",
                                                    size: 20
                                                )
                                            )
                                            .padding(.vertical, 5)
                                            .padding(.horizontal, 10)
                                            .foregroundStyle(.black)

                                    }

                                    .background(
                                        // --- Top Layer: The button itself ---
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.blueButtonTheme)
                                            .overlay(
                                                // Add the thin black border
                                                RoundedRectangle(
                                                    cornerRadius: 10
                                                )
                                                .stroke(.black, lineWidth: 1)
                                            )
                                    )
                                    .background(
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(.black)
                                        }
                                        // The magic offsets:
                                        .offset(x: 0, y: 2)  // Slightly right, heavily down
                                        .scaleEffect(x: 0.99, y: 1.0)
                                    )
                                    Text("- OR -")
                                        .font(
                                            .custom("PTSans-Narrow", size: 20)
                                        )
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 10)
                                    Button {
                                        randomGenre = settingsViewModel.genres.randomElement()?.name ?? ""
                                    } label: {
                                        Text("Random Genre")
                                            .font(
                                                .custom(
                                                    "PTSans-Narrow",
                                                    size: 20
                                                )
                                            )
                                            .padding(.vertical, 5)
                                            .padding(.horizontal, 10)
                                            .foregroundStyle(.black)

                                    }

                                    .background(
                                        // --- Top Layer: The button itself ---
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.blueButtonTheme)
                                            .overlay(
                                                // Add the thin black border
                                                RoundedRectangle(
                                                    cornerRadius: 10
                                                )
                                                .stroke(.black, lineWidth: 1)
                                            )
                                    )
                                    .background(
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(.black)
                                        }
                                        // The magic offsets:
                                        .offset(x: 0, y: 2)  // Slightly right, heavily down
                                        .scaleEffect(x: 0.99, y: 1.0)
                                    )
                                    Spacer()
                                }

                                if randomGenre != "" {
                                    Divider()
                                        .overlay(.white)
                                        .padding(.trailing, 20)
                                        .padding(.vertical, 20)
                                    
                                    HStack {
                                        Text(randomGenre)
                                            .font(
                                                .custom(
                                                    "PTSans-Narrow",
                                                    size: 30
                                                )
                                            )
                                            .foregroundStyle(.black)
                                        Spacer()
                                    }
                                    HStack {
                                        ScrollView {
                                            VStack {
                                                ForEach(filteredMoviesByGenre().movies, id: \.self) {
                                                    gen in
                                                    HStack {
                                                        Text(gen)
                                                            .font(
                                                                .custom("PTSans-Narrow", size: 25)
                                                            )
                                                            .padding(.bottom, 5)
                                                        Spacer()
                                                    }
                                                }
                                            }
                                            
                                            .padding(10)
                                        }
                                        .frame(width: 300, height: 200)
                                        .background(.black.opacity(0.3))
                                        .cornerRadius(10)
                                        Spacer()
                                    }
                                    HStack {
                                        Button {
                                            randomMovie = filteredMoviesByGenre().movies.randomElement() ?? "Nothing Found"
                                            showRandomlyChosenMovie = true
                                        } label: {
                                            Text("Random From List")
                                                .font(
                                                    .custom(
                                                        "PTSans-Narrow",
                                                        size: 20
                                                    )
                                                )
                                                .padding(.vertical, 5)
                                                .padding(.horizontal, 10)
                                                .foregroundStyle(.black)
                                        }
                                        .background(
                                            // --- Top Layer: The button itself ---
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(.blueButtonTheme)
                                                .overlay(
                                                    // Add the thin black border
                                                    RoundedRectangle(
                                                        cornerRadius: 10
                                                    )
                                                    .stroke(
                                                        .black,
                                                        lineWidth: 1
                                                    )
                                                )
                                        )
                                        .background(
                                            ZStack {
                                                RoundedRectangle(
                                                    cornerRadius: 10
                                                )
                                                .fill(.black)
                                            }
                                            // The magic offsets:
                                            .offset(x: 0, y: 2)  // Slightly right, heavily down
                                            .scaleEffect(x: 0.99, y: 1.0)
                                        )
                                        .padding(.top, 10)
                                        Spacer()
                                    }
                                }

                                Spacer()
                            }
                            .padding(.leading, 20)
                        }
                        .frame(
                            width: 350,
                            height: randomGenre != "" ? 560 : 300
                        )
                        .cornerRadius(15)
                        .background(
                            // --- Top Layer: The button itself ---
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.backgroundTheme)
                                .overlay(
                                    // Add the thin black border
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.black, lineWidth: 1)
                                )
                        )
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.black)
                            }
                            // The magic offsets:
                            .offset(x: 0, y: 2)  // Slightly right, heavily down
                            .scaleEffect(x: 0.99, y: 1.0)
                        )

                        .offset(y: randomGenre != "" ? 0 : 0)
                    }
                }
                Spacer()
                ZStack {
                    HStack {
                        HStack {
                            Button(action: {
                                withAnimation(
                                    .smooth(duration: 0.3, extraBounce: 0.3)
                                ) {
                                    tab = "home"
                                    xOffset = -145
                                }
                            }) {
                                if tab == "home" {
                                    Image(systemName: "house")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.yellowTheme)
                                } else {
                                    Image(systemName: "house")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.white)
                                }
                            }
                            .frame(width: 50, height: 40)
                            .cornerRadius(50)
                            .sensoryFeedback(
                                .impact(weight: .light),
                                trigger: tab
                            )

                            Button(action: {
                                withAnimation(
                                    .smooth(duration: 0.3, extraBounce: 0.3)
                                ) {
                                    tab = "search"
                                    xOffset = -87
                                }
                            }) {
                                if tab == "search" {
                                    Image(systemName: "magnifyingglass")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.yellowTheme)
                                } else {
                                    Image(systemName: "magnifyingglass")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.white)
                                }
                            }
                            .frame(width: 50, height: 40)
                            .cornerRadius(50)
                            .sensoryFeedback(
                                .impact(weight: .light),
                                trigger: tab
                            )

                            Button(action: {
                                withAnimation(
                                    .smooth(duration: 0.3, extraBounce: 0.3)
                                ) {
                                    tab = "file"
                                    xOffset = -29
                                }
                            }) {
                                if tab == "file" {
                                    Image(systemName: "arrow.up.arrow.down")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.yellowTheme)
                                } else {
                                    Image(systemName: "arrow.up.arrow.down")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.white)
                                }
                            }
                            .frame(width: 50, height: 40)
                            .cornerRadius(50)
                            .sensoryFeedback(
                                .impact(weight: .light),
                                trigger: tab
                            )

                            Button(action: {
                                withAnimation(
                                    .smooth(duration: 0.3, extraBounce: 0.3)
                                ) {
                                    tab = "history"
                                    xOffset = 29
                                }
                            }) {
                                if tab == "history" {
                                    Image(
                                        systemName:
                                            "clock.arrow.trianglehead.clockwise.rotate.90.path.dotted"
                                    )
                                    .font(.system(size: 20))
                                    .foregroundStyle(.yellowTheme)
                                } else {
                                    Image(
                                        systemName:
                                            "clock.arrow.trianglehead.clockwise.rotate.90.path.dotted"
                                    )
                                    .font(.system(size: 20))
                                    .foregroundStyle(.white)
                                }
                            }
                            .frame(width: 50, height: 40)
                            .cornerRadius(50)
                            .sensoryFeedback(
                                .impact(weight: .light),
                                trigger: tab
                            )

                            Button(action: {
                                withAnimation(
                                    .smooth(duration: 0.3, extraBounce: 0.3)
                                ) {
                                    tab = "settings"
                                    xOffset = 87
                                }
                            }) {
                                if tab == "settings" {
                                    Image(systemName: "gear")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.yellowTheme)
                                } else {
                                    Image(systemName: "gear")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.white)
                                }
                            }
                            .frame(width: 50, height: 40)
                            .cornerRadius(50)
                            .sensoryFeedback(
                                .impact(weight: .light),
                                trigger: tab
                            )

                        }
                        .padding()
                        .frame(width: 300, height: 55)
                        // .background(.blueTheme)
                        .cornerRadius(30)
                        .background(
                            // --- Top Layer: The button itself ---
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.grayTheme)
                                .overlay(
                                    // Add the thin black border
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.black, lineWidth: 1)
                                )
                        )
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.black)
                            }
                            // The magic offsets:
                            .offset(x: 0, y: 2)  // Slightly right, heavily down
                            .scaleEffect(x: 1.0, y: 1.0)
                        )
                        VStack {
                            Button(action: {
                                    withAnimation(.interpolatingSpring(stiffness: 170, damping: 25)) {
                                    tab = tab == "newItem" ? "home" : "newItem"
                                    newItem = "Movie"
                                    xOffset = -145
                                }
                            }) {
                                Image(systemName: "plus")
                                        .font(.system(size: 20))
                                        .foregroundStyle(tab == "newItem" ? .black : .blueTheme)
                                }
                                .frame(width: 50, height: 40)
                                .cornerRadius(50)
                                .sensoryFeedback(
                                    .impact(weight: .light),
                                    trigger: tab
                                )
                                .rotationEffect(.degrees(tab == "newItem" ? 45 : 0))

                        }
                        .frame(width: 50, height: 50)
                        .background(tab == "newItem" ? .seafoamBlue : .yellowTheme)
                        .clipShape(Capsule())
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.blueTheme)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(.black, lineWidth: 1)
                                )
                        )
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(.black)
                            }
                            // The magic offsets:
                            .offset(x: 0, y: 1)  // Slightly right, heavily down
                                .scaleEffect(x: 0.99, y: 1.0)
                        )
                    }

                    if tab != "newItem" {
                        ZStack {
                            Rectangle()
                                .fill(.blueTheme)
                                .frame(width: 45, height: 45)
                                .cornerRadius(15)
                                .background(
                                    // --- Top Layer: The button itself ---
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.yellowTheme)
                                        .overlay(
                                            // Add the thin black border
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(.black, lineWidth: 1)
                                        )
                                )
                                .background(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(.black)
                                    }
                                    // The magic offsets:
                                        .offset(x: 0, y: 1)  // Slightly right, heavily down
                                        .scaleEffect(x: 1.0, y: 1.0)
                                )
                            Image(systemName: getIcon())
                                .font(.system(size: 20))
                                .foregroundStyle(.yellowTheme)
                            
                        }
                        .offset(x: CGFloat(xOffset))
                    } else {
                        ZStack {
                            HStack {
                                Text("Movie")
                                    .font(.custom("Poppins-Bold", size: 20))
                                    .foregroundStyle(newItem == "Movie" ? .white : .blueTheme)
                                    .onTapGesture {
                                        withAnimation(.smooth(duration: 0.5, extraBounce: 0.3)) {
                                            newItem = "Movie"
                                        }
                                    }
                                    .sensoryFeedback(.impact(weight: .light), trigger: newItem)


                                Spacer()
                                Text("Genre")
                                    .font(.custom("Poppins-Bold", size: 20))
                                    .foregroundStyle(newItem == "Genre" ? .white : .blueTheme)
                                    .onTapGesture {
                                        withAnimation(.smooth(duration: 0.5, extraBounce: 0.3)) {
                                            newItem = "Genre"
                                        }
                                    }
                                    .sensoryFeedback(.impact(weight: .light), trigger: newItem)

                                Spacer()

                                Text("Folder")
                                    .font(.custom("Poppins-Bold", size: 20))
                                    .foregroundStyle(newItem == "Folder" ? .white : .blueTheme)
                                    .onTapGesture {
                                        withAnimation(.smooth(duration: 0.5, extraBounce: 0.3)) {
                                            newItem = "Folder"
                                        }
                                    }
                                    .sensoryFeedback(.impact(weight: .light), trigger: newItem)

                            }
                            .padding()
                            .frame(width: 300, height: 55)
                            // .background(.blueTheme)
                            .cornerRadius(30)
                            .background(
                                // --- Top Layer: The button itself ---
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.yellowTheme)
                                    .overlay(
                                        // Add the thin black border
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(.black, lineWidth: 1)
                                    )
                            )
                            .background(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.black)
                                }
                                // The magic offsets:
                                .offset(x: 0, y: 2)  // Slightly right, heavily down
                                .scaleEffect(x: 1.0, y: 1.0)
                            )
                            
                        }
                       .offset(x: -30)
                       .transition(
                        .move(edge: .leading).combined(with: .opacity)
                       )
                    }
                }
                .transition(
                 .move(edge: .trailing).combined(with: .opacity)
                )

            }
            .padding(.top, -30)
            // width
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.95
            }
            // height
            .containerRelativeFrame(.vertical) { length, axis in
                return length * 1
            }
            

            if showRandomlyChosenMovie {
                VStack {
                    VStack {
                        HStack {
                            Spacer()
                            Text(randomMovie)
                                .font(.custom("PTSans-Narrow", size: 40))
                                //.padding(.horizontal, 10)
                                .padding(.top, 10)
                                .foregroundStyle(.yellowTheme)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            ZStack {
                                Image(systemName: "folder.fill")
                                    .foregroundStyle(.blueButtonTheme)
                                    .font(.system(size: 140))
                                Text("B12")
                                    .font(.custom("PTSans-Narrow", size: 60))
                                    .padding(.horizontal, 10)
                                    .foregroundStyle(.white)
                            }
                            Spacer()
                        }

                        HStack {
                            Spacer()
                            Button {
                                showRandomlyChosenMovie = false
                            } label: {
                                Text("Close")
                                    .font(.custom("PTSans-Narrow", size: 25))
                                    .foregroundStyle(.seafoamBlue)
                            }
                            Button {
                                randomMovie = filteredMoviesByGenre().movies.randomElement() ?? "Nothing Found"
                            } label: {
                                Text("Choose Again")
                                    .font(.custom("PTSans-Narrow", size: 25))
                                    .foregroundStyle(.brown)
                            }
                            .padding(.leading, 20)
                        }
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                        .padding(.trailing, 20)
                    }
                    .containerRelativeFrame(.horizontal) { length, axis in
                        return length * 0.9
                    }
                    .background(.blueTheme)
                    .cornerRadius(10)
                    .shadow(
                        color: .white.opacity(0.9),
                        radius: 4,
                        x: 0,
                        y: 0
                    )
                }
                .frame(width: 600, height: 1000)
                .background(.black.opacity(0.6))
            }

        }
        .edgesIgnoringSafeArea(.all)
        .ignoresSafeArea(.keyboard, edges: .bottom)

        .frame(maxWidth: .infinity, maxHeight: .infinity)

    }
}

#Preview {
    HomeView()
}
