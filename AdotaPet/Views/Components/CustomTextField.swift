//
//  CustomTextField.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 25/08/26.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        TextField(placeholder, text: $text)
            .keyboardType(keyboardType)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(8)
    }
}
