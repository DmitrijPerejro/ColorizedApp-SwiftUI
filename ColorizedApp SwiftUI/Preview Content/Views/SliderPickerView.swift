//
//  SliderPickerView.swift
//  ColorizedApp SwiftUI
//
//  Created by Perejro on 24/12/2024.
//

import SwiftUI

struct SliderPickerView: View {
    @Binding var value: Double
    @State private var inputValue: String = ""
    @State private var isAlertOpened: Bool = false
    
    let accentColor: Color

    var body: some View {
        HStack(spacing: 16) {
            Text("\(value.formatted())")
                .frame(width: 40)
                .foregroundStyle(accentColor)
            
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(accentColor)
                .onChange(of: value) { _, newValue in
                    inputValue = newValue.formatted()
                }
            
            TextFieldView(
                value: $inputValue,
                onEndEditing: validateTextFieldValue
            )
        }
        .onAppear {
            inputValue = value.formatted()
        }
        .alert(
            "Invalid Value",
            isPresented: $isAlertOpened,
            actions: {
                Button("OK") {
                    withAnimation {
                        value = 0
                    }
                    inputValue = value.formatted()
                    isAlertOpened = false
                }
            },
            message: {
                let message = inputValue.isEmpty ?
                    "Value must be between 0 and 255" :
                    "Value \(inputValue) is out of range"
                Text(message)
            }
        )
    }
    
    private func validateTextFieldValue()  {
        if let value = Double(inputValue), value >= 0 && value <= 255 {
            self.value = value
            return
        }
        
        isAlertOpened = true
    }
}

#Preview {
    SliderPickerView(value: .constant(128), accentColor: .yellow)
}
