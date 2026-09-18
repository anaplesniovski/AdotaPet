//
//  PetImageView.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 15/09/26.
//

import SwiftUI

struct PetImageView: View {
    let pet: Pet
    var cornerRadius: CGFloat = 24

    var body: some View {
        switch pet.image {
        case .asset(let name):
            Image(name)
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))

        case .data(let data):
            if let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            } else {
                fallbackView
            }

        case nil:
            fallbackView
        }
    }

    private var fallbackView: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(Color("AppGreen").opacity(0.15))
            .overlay {
                Image(systemName: pet.species.icon)
                    .font(.system(size: 40))
                    .foregroundStyle(Color("AppGreen"))
            }
    }
}
