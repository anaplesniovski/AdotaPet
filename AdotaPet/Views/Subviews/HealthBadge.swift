//
//  HealthBadge.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 28/08/26.
//

import SwiftUI

struct HealthBadge: View {
    let icon: String
    let text: String
    let isActive: Bool
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .font(.subheadline)
            Text(text)
                .font(.subheadline)
                .fontWeight(.medium)
        }
        .foregroundStyle(isActive ? Color("AppGreen") : .secondary)
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(isActive ? Color("AppGreen").opacity(0.15) : Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
