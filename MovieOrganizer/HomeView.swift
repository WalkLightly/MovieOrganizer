//
//  HomeView.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 1/14/26.
//

import SwiftUI

struct HomeView: View {
    @State private var tab: String = "home"
    @State private var xOffset = -150
    @State private var showShuffle: Bool = false
    @State private var randomGenre: String = ""
    @State private var showRandomlyChosenMovie: Bool = false
    @State private var randomMovie: String =
        "Chronicles of Narnia The Lion, The Witch, and the Wardrobe disc 1"

    func getIcon() -> String {

        switch tab {
            case "home":
                return "house"
            case "search":
                return "magnifyingglass"
            case "chart":
                return "chart.bar.yaxis"
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
                                    //  xOffset = 116
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
                .padding(.top, 40)
                .frame(width: 700, height: 100)

                // MAIN VIEW
                VStack {
                    if tab == "home" {
//                        Spacer()
                     //  ScrollView {
                            MovieListView()
                   //    }
                       // Spacer()
                    } else if tab == "chart" {
                      //  DataView()
                    } else if tab == "settings" {
                        SettingsView()
                    }
                    Spacer()
                }

                // width
                .containerRelativeFrame(.horizontal) { length, axis in
                    return length * 0.95
                }
                // height
                .containerRelativeFrame(.vertical) { length, axis in
                    return length * 0.80
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
                                        .foregroundStyle(.yellowTheme)
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
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(.blueButtonTheme)
                                            .overlay(
                                                // Add the thin black border
                                                RoundedRectangle(
                                                    cornerRadius: 15
                                                )
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
                                    Text("- OR -")
                                        .font(
                                            .custom("PTSans-Narrow", size: 20)
                                        )
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 10)
                                    Button {
                                        randomGenre = "Christmas"
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
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(.blueButtonTheme)
                                            .overlay(
                                                // Add the thin black border
                                                RoundedRectangle(
                                                    cornerRadius: 15
                                                )
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
                                            .foregroundStyle(.yellowTheme)
                                        Spacer()
                                    }

                                    HStack {
                                        VStack {

                                        }
                                        .frame(width: 300, height: 200)
                                        .border(.white)
                                        Spacer()
                                    }
                                    HStack {
                                        Button {
                                            //randomGenre = "Christmas"
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
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(.blueButtonTheme)
                                                .overlay(
                                                    // Add the thin black border
                                                    RoundedRectangle(
                                                        cornerRadius: 15
                                                    )
                                                    .stroke(
                                                        .black,
                                                        lineWidth: 2
                                                    )
                                                )
                                        )
                                        .background(
                                            ZStack {
                                                RoundedRectangle(
                                                    cornerRadius: 15
                                                )
                                                .fill(.black)
                                            }
                                            // The magic offsets:
                                            .offset(x: 0, y: 4)  // Slightly right, heavily down
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
                                .fill(.grayTheme)
                                .overlay(
                                    // Add the thin black border
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.black, lineWidth: 2)
                                )
                        )
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.black)
                            }
                            // The magic offsets:
                            .offset(x: 0, y: 4)  // Slightly right, heavily down
                            .scaleEffect(x: 0.99, y: 1.0)
                        )

                        .offset(y: randomGenre != "" ? -5 : -5)
                    }
                }
                ZStack {
                    HStack {
                        HStack {
                            Button(action: {
                                withAnimation(
                                    .smooth(duration: 0.3)
                                ) {
                                    tab = "home"
                                    xOffset = -150
                                }
                            }) {
                                if tab == "home" {
                                    Image(systemName: "house")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.blueTheme)
                                } else {
                                    Image(systemName: "house")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.blueTheme)
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
                                    .smooth(duration: 0.3)
                                ) {
                                    tab = "search"
                                    xOffset = -92
                                }
                            }) {
                                if tab == "search" {
                                    Image(systemName: "magnifyingglass")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.yellowTheme)
                                } else {
                                    Image(systemName: "magnifyingglass")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.blueTheme)
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
                                    .smooth(duration: 0.3)
                                ) {
                                    tab = "chart"
                                    xOffset = -35
                                }
                            }) {
                                if tab == "chart" {
                                    Image(systemName: "chart.bar.yaxis")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.yellowTheme)
                                } else {
                                    Image(systemName: "chart.bar.yaxis")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.blueTheme)
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
                                    .smooth(duration: 0.3)
                                ) {
                                    tab = "history"
                                    xOffset = 25
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
                                    .foregroundStyle(.blueTheme)
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
                                    .smooth(duration: 0.3)
                                ) {
                                    tab = "settings"
                                    xOffset = 82
                                }
                            }) {
                                if tab == "settings" {
                                    Image(systemName: "gear")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.yellowTheme)
                                } else {
                                    Image(systemName: "gear")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.blueTheme)
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
                                .fill(.backgroundTheme)
                                .overlay(
                                    // Add the thin black border
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.black, lineWidth: 2)
                                )
                        )
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.black)
                            }
                            // The magic offsets:
                            .offset(x: 0, y: 6)  // Slightly right, heavily down
                            .scaleEffect(x: 1.0, y: 1.0)
                        )
                        VStack {
                            Button(action: {
                                withAnimation(
                                    .smooth(duration: 0.3)
                                ) {
                                    //tab = "settings"
                                    //  xOffset = 116
                                }
                            }) {
                                Image(systemName: "plus")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.blueTheme)
                            }
                            .frame(width: 50, height: 40)
                            .cornerRadius(50)
                            .sensoryFeedback(
                                .impact(weight: .light),
                                trigger: tab
                            )
                        }
                        .frame(width: 50, height: 50)
                        .background(.yellowTheme)
                        .clipShape(Capsule())
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.blueTheme)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(.black, lineWidth: 2)
                                )
                        )
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(.black)
                            }
                            // The magic offsets:
                            .offset(x: 0, y: 4)  // Slightly right, heavily down
                                .scaleEffect(x: 0.99, y: 1.0)
                        )
                    }

                    ZStack {
                        Rectangle()
                            .fill(.yellowTheme)
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
                                .offset(x: 0, y: 3)  // Slightly right, heavily down
                                .scaleEffect(x: 1.0, y: 1.0)
                            )
                        Image(systemName: getIcon())
                            .font(.system(size: 20))
                            .foregroundStyle(.blueTheme)

                    }
                    .offset(x: CGFloat(xOffset))
                }

            }
            .padding(.top, -30)
            // width
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 0.95
            }
            // height
            .containerRelativeFrame(.vertical) { length, axis in
                return length * 1.05
            }
            

            if showRandomlyChosenMovie {
                VStack {
                    VStack {
                        Text(randomMovie)
                            .font(.custom("PTSans-Narrow", size: 30))
                            .padding(.horizontal, 10)
                            .padding(.top, 10)
                            .foregroundStyle(.yellowTheme)
                        HStack {
                            ZStack {
                                Image(systemName: "folder.fill")
                                    .foregroundStyle(.blueButtonTheme)
                                    .font(.system(size: 70))
                                Text("B12")
                                    .font(.custom("PTSans-Narrow", size: 30))
                                    .padding(.horizontal, 10)
                                    .foregroundStyle(.white)
                            }
                            Spacer()
                        }
                        .padding(.leading, 10)

                        HStack {
                            Spacer()
                            Button {
                                showRandomlyChosenMovie = false
                            } label: {
                                Text("Close")
                                    .font(.custom("PTSans-Narrow", size: 25))
                                    .foregroundStyle(.seafoamBlue)
                            }
                        }
                        .padding(.top, 30)
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
