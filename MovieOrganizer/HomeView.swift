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

    var body: some View {
        ZStack {
            Color(.grayTheme).ignoresSafeArea()

            VStack {
                HStack {
                    HStack {
                        Text("Video Library")
                            .font(.custom("PTSans-Narrow", size: 50))
                            .foregroundStyle(.black)
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
                                        "arrow.trianglehead.2.clockwise.rotate.90"
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
                                    .smooth(duration: 0.3, extraBounce: 0.4)
                                ) {
                                    //tab = "settings"
                                    //  xOffset = 116
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
//                .background(
//                    RoundedRectangle(cornerRadius: 30)
//                        .fill(.blueTheme)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 30)
//                                .stroke(.black, lineWidth: 2)
//                        )
//                        .shadow(
//                            color: Color.black.opacity(0.7),
//                            radius: 2,
//                            x: 3,
//                            y: 4
//                        )
//
//                )
//                .background(
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 30)
//                            .fill(.white)
//                    }
//                    .offset(x: -10, y: 7)  // Slightly right, heavily down
//                    .scaleEffect(x: 1, y: 1.0)
//                    .rotationEffect(Angle(degrees: 1))
//                )
//                .background(
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 30)
//                            .fill(.black)
//                            .shadow(
//                                color: Color.black.opacity(0.7),
//                                radius: 2,
//                                x: 3,
//                                y: 4
//                            )
//
//                    }
//                    .offset(x: -10, y: 14)  // Slightly right, heavily down
//                    .scaleEffect(x: 1, y: 1.0)
//                    .rotationEffect(Angle(degrees: 2))
//
//                )
//                .background(
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 30)
//                            .fill(.yellowTheme)
//                    }
//                    .offset(x: -100, y: 19)  // Slightly right, heavily down
//                    .scaleEffect(x: 1, y: 1.0)
//                    .rotationEffect(Angle(degrees: 2.8))
//
//                )

                // MAIN VIEW
                VStack {
                }
                // width
                .containerRelativeFrame(.horizontal) { length, axis in
                    return length * 0.95
                }
                // height
                .containerRelativeFrame(.vertical) { length, axis in
                    return length * 0.84
                }
                .border(.white)
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
                                        .foregroundStyle(.yellowTheme)
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
                                    tab = "download"
                                    xOffset = 25
                                }
                            }) {
                                if tab == "download" {
                                    Image(systemName: "arrow.down.to.line")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.yellowTheme)
                                } else {
                                    Image(systemName: "arrow.down.to.line")
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
                        .frame(width: 300, height: 60)
                        // .background(.blueTheme)
                        .cornerRadius(30)
                        .background(
                            // --- Top Layer: The button itself ---
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.blueTheme)
                                .overlay(
                                    // Add the thin black border
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
                            .offset(x: 0, y: 5)  // Slightly right, heavily down
                            .scaleEffect(x: 0.99, y: 1.0)
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

                    Rectangle()
                        .fill(.yellowTheme.opacity(0.3))
                        .frame(width: 50, height: 40)
                        .cornerRadius(20)
                        .offset(x: CGFloat(xOffset), y: 0)
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
