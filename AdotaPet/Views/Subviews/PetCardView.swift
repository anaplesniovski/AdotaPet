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
            // foto do pet
            Image(pet.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            // Infos
            VStack(alignment: .leading, spacing: 6) {
                Text(pet.name)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("\(pet.breed) • \(pet.species.name)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack(spacing: 8) {
                    Label(pet.age, systemImage: "calendar")
                    Label(pet.gender.label, systemImage: "pawprint.fill")
                }
                .font(.caption)
                .foregroundColor(.secondary)
                
                HStack(spacing: 4) {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(Color("AppGreen"))
                    Text(pet.city)
                        .foregroundColor(.secondary)
                }
                .font(.caption)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
                .font(.caption)
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
    }
}

#Preview {
    PetCardView(pet: MockPets.pets[0])
        .padding()
}
