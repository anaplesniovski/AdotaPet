//
//  PetDetailView.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 29/08/26.
//

import SwiftUI

struct PetDetailView: View {
    let pet: Pet
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // foto do pet
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color("AppGreen").opacity(0.15))
                    .frame(maxWidth: .infinity)
                    .frame(height: 280)
                    .overlay(
                        Image(systemName: pet.species == "Cachorro" ? "dog.fill" : "cat.fill")
                            .font(.system(size: 80))
                            .foregroundColor(Color("AppGreen"))
                    )
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    // nome e espécie
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(pet.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text("\(pet.breed) • \(pet.species)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Text(pet.gender)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("AppGreen"))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color("AppGreen").opacity(0.15))
                            .cornerRadius(20)
                    }
                    
                    // infos rápidas
                    HStack(spacing: 12) {
                        InfoChip(icon: "calendar", text: pet.age)
                        InfoChip(icon: "arrow.up.and.down", text: pet.size)
                        InfoChip(icon: "mappin.circle.fill", text: pet.city)
                    }
                    
                    // temperamento
                    VStack(alignment: .leading, spacing: 8) {
                        Text(String(localized: "detail.temperament"))
                            .font(.headline)
                            .fontWeight(.bold)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(pet.temperament, id: \.self) { trait in
                                    Text(trait)
                                        .font(.caption)
                                        .fontWeight(.medium)
                                        .foregroundColor(Color("AppGreen"))
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(Color("AppGreen").opacity(0.15))
                                        .cornerRadius(20)
                                }
                            }
                        }
                    }
                    
                    // saúde
                    VStack(alignment: .leading, spacing: 8) {
                        Text(String(localized: "detail.health"))
                            .font(.headline)
                            .fontWeight(.bold)
                        HStack(spacing: 12) {
                            HealthBadge(
                                icon: "cross.circle.fill",
                                text: String(localized: "detail.vaccinated"),
                                isActive: pet.vaccinated
                            )
                            HealthBadge(
                                icon: "scissors",
                                text: String(localized: "detail.neutered"),
                                isActive: pet.neutered
                            )
                        }
                    }
                    
                    // descrição
                    VStack(alignment: .leading, spacing: 8) {
                        Text(String(format: String(localized: "detail.about"), pet.name))
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(pet.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .lineSpacing(4)
                    }
                    
                    // btn de contato
                    Button(action: {
                        let phone = pet.contactPhone
                        if let url = URL(string: "https://wa.me/55\(phone)") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        HStack {
                            Image(systemName: "message.fill")
                            Text(String(format: String(localized: "detail.contact.button"), pet.contactName))
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .background(Color("AppGreen"))
                        .cornerRadius(16)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 32)
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    NavigationStack {
        PetDetailView(pet: MockPets.pets[0])
    }
}
