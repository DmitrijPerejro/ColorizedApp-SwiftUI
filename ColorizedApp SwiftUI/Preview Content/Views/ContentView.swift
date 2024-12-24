//
//  ContentView.swift
//  ColorizedApp SwiftUI
//
//  Created by Perejro on 23/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State var redSliderValue = Double.random(in: 0...255).rounded()
    @State var greenSliderValue = Double.random(in: 0...255).rounded()
    @State var blueSliderValue = Double.random(in: 0...255).rounded()
    
    @FocusState var focused: Bool

    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                ResultDisplayColorView(
                    red: redSliderValue,
                    green: greenSliderValue,
                    blue: blueSliderValue
                )
                VStack {
                    SliderPickerView(value: $redSliderValue, accentColor: .red)
                    SliderPickerView(value: $greenSliderValue, accentColor: .green)
                    SliderPickerView(value: $blueSliderValue, accentColor: .blue)
                }
                Spacer()
            }
            .padding(20)
        }
        .background(Color(red: 0.53, green: 0.9, blue: 1))
        .focused($focused)
        .onTapGesture {
            focused = false
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    focused = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
