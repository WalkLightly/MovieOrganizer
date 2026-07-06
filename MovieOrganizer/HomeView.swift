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
    
    @State private var jumpOffset: CGFloat = 0    // Controls the upward movement
    @State private var jumpRotation: Angle = .zero
        private let jumpHeight: CGFloat = -5 // Negative goes UP
        private let runLeanAngle = 0.0

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
            Color(.grayTheme).ignoresSafeArea()

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
                                    .smooth(duration: 0.3, extraBounce: 0.4)
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
                                    .smooth(duration: 0.6, extraBounce: 0.4)
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
                    if tab == "chart" {
                        DataView()
                    } else if tab == "settings" {
                        SettingsView()
                    }

                }
                // width
                .containerRelativeFrame(.horizontal) { length, axis in
                    return length * 0.95
                }
                // height
                .containerRelativeFrame(.vertical) { length, axis in
                    return length * 0.84
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
                                .fill(.blueTheme)
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
                //                .background(
                //                    // --- Top Layer: The button itself ---
                //                    RoundedRectangle(cornerRadius: 15)
                //                        .fill(.red.opacity(0.1))
                //                        .overlay(
                //                            // Add the thin black border
                //                            RoundedRectangle(cornerRadius: 15)
                //                                .stroke(.black, lineWidth: 2)
                //                        )
                //                )
                //                .background(
                //                    ZStack {
                //                        RoundedRectangle(cornerRadius: 15)
                //                            .fill(.black)
                //                    }
                //                    // The magic offsets:
                //                    .offset(x: 0, y: 4)  // Slightly right, heavily down
                //                    .scaleEffect(x: 0.99, y: 1.0)
                //                )
                //           .border(.white)
                // .padding(.top, 20)

                ZStack {
                    HStack {
                        HStack {
                            Button(action: {
                                withAnimation(
                                    .smooth(duration: 0.3, extraBounce: 0.4)
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
                                        .foregroundStyle(.yellowTheme)
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
                                    .smooth(duration: 0.3, extraBounce: 0.4)
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
                                        .foregroundStyle(.yellowTheme)
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
                                    .smooth(duration: 0.3, extraBounce: 0.4)
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
                                        .foregroundStyle(.yellowTheme)
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
                                    .smooth(duration: 0.3, extraBounce: 0.4)
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
                                    .foregroundStyle(.yellowTheme)
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
                                    .smooth(duration: 0.3, extraBounce: 0.4)
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
                                        .foregroundStyle(.yellowTheme)
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
                        .frame(width: 300, height: 70)
                        // .background(.blueTheme)
                        .cornerRadius(30)
                        .background(
                            // --- Top Layer: The button itself ---
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.blueTheme)
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
                            .offset(x: 0, y: 6)  // Slightly right, heavily down
                            .scaleEffect(x: 1.0, y: 1.0)
                        )
                        VStack {
                            Button(action: {
                                withAnimation(
                                    .smooth(duration: 0.3, extraBounce: 0.4)
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
                        .frame(width: 60, height: 60)
                        .background(.yellowTheme)
                        .clipShape(Capsule())
                        .background(
                            // --- Top Layer: The button itself ---
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.blueTheme)
                                .overlay(
                                    // Add the thin black border
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
                            .frame(width: 55, height: 55)
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
                    .offset(y: jumpOffset)
                    .rotationEffect(jumpRotation, anchor: .bottom)
                    .onChange(of: tab) { _, newValue in
                                // When the tab is clicked, start the multi-stage animation sequence:
                                
                                // 1. Initial State: It's resting on the ground, leaning forward towards new spot.
                                jumpOffset = 0
                                
                                // Dynamic lean: Negative rotation when moving towards positive X, Positive when moving negative X.
                                // Example for Tab 0 -> Tab 1 (moving right): lean back (-leanValue), then lean forward (+leanValue).
                                let targetLean: Double = (newValue > tab ? runLeanAngle : -runLeanAngle) * -1
                                jumpRotation = Angle(degrees: targetLean)

                                // --- STAGE 1: JUMPING UP ---
                                // Use a powerful spring for the ascent. The 'lean' also resets during the rise.
                                withAnimation(.spring(response: 0.1, dampingFraction: 0.9, blendDuration: 0.1)) {
                                    jumpOffset = jumpHeight // It goes UP
                                    jumpRotation = Angle(degrees: -3) // Straightens up during ascent
                                }
                                
                                // --- STAGE 2: FALLING DOWN (The bounce effect) ---
                                // Use a standard non-bouncy easing (like easeIn) for the descent, then a strong bounce when it hits the ground.
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { // Timing needs tuning based on Stage 1
                                    withAnimation(.interpolatingSpring(stiffness: 100, damping: 9, initialVelocity: 5).delay(0.0)) {
                                        jumpOffset = 0 // It hits the ground
                                        
                                        // Add some rotation logic back when landing? (e.g., slight backward lean on impact)
                                        jumpRotation = Angle(degrees: (newValue > tab ? -runLeanAngle : runLeanAngle) * 0.5)
                                    }
                                }
                                
                                // The Horizontal Position animation happens automatically and smoothly because
                                // `horizontalPosition(for:)` recalculates and the SwiftUI system handles the transition.
                            }
                    

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
                            //                            .background(
                            //                                // --- Top Layer: The button itself ---
                            //                                RoundedRectangle(cornerRadius: 30)
                            //                                    .fill(.seafoamBlue)
                            //                                    .overlay(
                            //                                        // Add the thin black border
                            //                                        RoundedRectangle(cornerRadius: 30)
                            //                                            .stroke(.black, lineWidth: 2)
                            //                                    )
                            //                            )
                            //                            .background(
                            //                                ZStack {
                            //                                    RoundedRectangle(cornerRadius: 30)
                            //                                        .fill(.black)
                            //                                }
                            //                                // The magic offsets:
                            //                                .offset(x: 0, y: 4)  // Slightly right, heavily down
                            //                                .scaleEffect(x: 0.99, y: 1.0)
                            //                            )
                        }
                        .padding(.top, 30)
                        .padding(.bottom, 15)
                        .padding(.trailing, 20)
                    }
                    .containerRelativeFrame(.horizontal) { length, axis in
                        return length * 0.9
                    }
                    //                    // height
                    //                    .containerRelativeFrame(.vertical) { length, axis in
                    //                        return length * 0.2
                    //                    }
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)

    }
}

#Preview {
    HomeView()
}

//            Button(action: {
//                        print("Button Tapped!")
//                    }) {
//                        Text("Small Change")
//                            .font(.system(size: 22, weight: .bold))
//                            .foregroundColor(.black) // Match text to border
//                            .padding(.vertical, 10)
//                            .padding(.horizontal, 32)
//                            // Use a flexible frame to fit the content
//                            .frame(minWidth: 200)
//                            .background(
//                                // --- Top Layer: The button itself ---
//                                RoundedRectangle(cornerRadius: 30)
//                                    .fill(.seafoamBlue)
//                                    .overlay(
//                                        // Add the thin black border
//                                        RoundedRectangle(cornerRadius: 30)
//                                            .stroke(.black, lineWidth: 2)
//                                    )
//                            )
//                            .background(
//                                ZStack {
//                                    RoundedRectangle(cornerRadius: 30)
//                                        .fill(.black)
//                                }
//                                // The magic offsets:
//                                .offset(x: 0, y: 4) // Slightly right, heavily down
//                                .scaleEffect(x: 0.99, y: 1.0)
//                            )
//                    }
//                    .padding()
