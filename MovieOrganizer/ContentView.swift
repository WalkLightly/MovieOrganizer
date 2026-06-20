//
//  ContentView.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 1/14/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.backgroundTheme)
            Button(action: {
                        print("Button Tapped!")
                    }) {
                        Text("Get started")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.black) // Match text to border
                            .padding(.vertical, 10)
                            .padding(.horizontal, 32)
                            // Use a flexible frame to fit the content
                            .frame(minWidth: 200)
                            .background(
                                // --- Top Layer: The button itself ---
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(.seafoamBlue)
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
                                .offset(x: 0, y: 4) // Slightly right, heavily down
                                .scaleEffect(x: 0.99, y: 1.0)
                            )
                    }
                    .padding()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
