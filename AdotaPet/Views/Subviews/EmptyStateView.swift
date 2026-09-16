//
//  EmptyStateView.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 15/09/26.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "pawprint.slash.fill")
                .font(.system(size: 60))
                .foregroundStyle(Color("AppGreen").opacity(0.5))
            
            Text(String(localized: "empty.title"))
                .font(.headline)
                .fontWeight(.bold)
            
            Text(String(localized: "empty.subtitle"))
                .font(.subheadline)
                .foregroundStyle(.secondary) 
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 60)
        .padding(.horizontal)
    }
}

#Preview {
    EmptyStateView()
}
