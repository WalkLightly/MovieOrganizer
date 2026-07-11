//
//  AddItem.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/11/26.
//

import SwiftUI

struct AddItem: View {
    
    @State var chosenItem: String
    
    var body: some View {
        ZStack {
            VStack {
                Color(.black.opacity(0.5))
            }
            //.padding(.bottom, 470)
            .frame(height: 1500)
            .containerRelativeFrame(.horizontal) { length, axis in
                return length * 1
            }
            VStack {
                VStack {
                    Text("Hello")
                }
                .containerRelativeFrame(.horizontal) { length, axis in
                    return length * 0.9
                }
                .containerRelativeFrame(.vertical) { length, axis in
                    return length * 0.5
                }
                .background(.grayTheme)
                .padding(.top, 200)
                .shadow(
                    color: .white.opacity(0.9),
                    radius: 4,
                    x: 0,
                    y: 0
                )
            }
        }
    }
}

#Preview {
    AddItem(chosenItem: "Movie")
}
