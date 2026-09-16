//
//  SpeciesFilterButton.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 26/08/26.
//

import SwiftUI

struct SpeciesFilterButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(isSelected ? .semibold : .regular)
                .foregroundStyle(isSelected ? .white : .primary)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? Color("AppGreen") : Color(.systemGray6))
                .clipShape(Capsule())
        }
    }
}
