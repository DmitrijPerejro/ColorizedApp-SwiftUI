//
//  ResultDisplayColor.swift
//  ColorizedApp SwiftUI
//
//  Created by Perejro on 24/12/2024.
//

import SwiftUI

struct ResultDisplayColorView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    private let maxColorValue: Double = 255
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(
                Color(
                    red: red / maxColorValue,
                    green: green / maxColorValue,
                    blue: blue / maxColorValue
                )
            )
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white, lineWidth: 5)
            )
            .overlay(
                Text("RGB(\(red.formatted()), \(green.formatted()), \(blue.formatted()))")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .shadow(color: .black, radius: 1, x: 0, y: 0)
            )
    }
}

#Preview {
    ResultDisplayColorView(
        red: 50,
        green: 100,
        blue: 150
    )
}
