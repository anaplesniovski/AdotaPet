//
//  PetCardView.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 26/08/26.
//

import SwiftUI

struct PetCardView: View {
    let pet: Pet

    var body: some View {
        HStack(spacing: 16) {
            PetImageView(pet: pet, cornerRadius: 12)
                .frame(width: 90, height: 90)
                .clipped()

            petInfo

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
                .font(.caption)
        }
        .padding(16)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
    }

    private var petInfo: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(pet.name)
                .font(.headline)
                .fontWeight(.bold)

            Text("\(pet.breed) • \(pet.species.name)")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            HStack(spacing: 8) {
                Label(pet.age, systemImage: "calendar")
                Label(pet.gender.label, systemImage: "pawprint.fill")
            }
            .font(.caption)
            .foregroundStyle(.secondary)

            HStack(spacing: 4) {
                Image(systemName: "mappin.circle.fill")
                    .foregroundStyle(Color("AppGreen"))
                Text(pet.city)
                    .foregroundStyle(.secondary)
            }
            .font(.caption)
        }
    }
}

#Preview {
    PetCardView(pet: MockPets.pets[0])
        .padding()
}
