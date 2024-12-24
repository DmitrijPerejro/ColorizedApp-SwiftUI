//
//  TextFieldView.swift
//  ColorizedApp SwiftUI
//
//  Created by Perejro on 24/12/2024.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var value: String
    let onEndEditing: () -> Void
   
    var body: some View {
        TextField("", text: $value) { _ in
            withAnimation {
                onEndEditing()
            }
        }
        .frame(width: 60)
        .keyboardType(.numberPad)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .multilineTextAlignment(.center)
         
    }
}

#Preview {
    TextFieldView(
        value: .constant("100"),
        onEndEditing: {}
    )
}
