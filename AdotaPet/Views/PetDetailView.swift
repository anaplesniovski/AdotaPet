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
                petImage
                VStack(alignment: .leading, spacing: 20) {
                    nameSection
                    quickInfo
                    temperamentSection
                    healthSection
                    descriptionSection
                    contactButton
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 32)
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
    }

    // MARK: - Sections

    private var petImage: some View {
        PetImageView(pet: pet)
            .frame(maxWidth: .infinity)
            .frame(height: 280)
            .clipped()
            .padding(.horizontal)
    }

    private var nameSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(pet.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("\(pet.breed) • \(pet.species.name)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(pet.gender.label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color("AppGreen"))
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color("AppGreen").opacity(0.15))
                .clipShape(Capsule())
        }
    }

    private var quickInfo: some View {
        HStack(spacing: 12) {
            InfoChip(icon: "calendar", text: pet.age)
            InfoChip(icon: "arrow.up.and.down", text: pet.size.description)
            InfoChip(icon: "mappin.circle.fill", text: pet.city)
        }
    }

    private var temperamentSection: some View {
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
                            .foregroundStyle(Color("AppGreen"))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color("AppGreen").opacity(0.15))
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }

    private var healthSection: some View {
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
    }

    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(String(format: String(localized: "detail.about"), pet.name))
                .font(.headline)
                .fontWeight(.bold)
            Text(pet.description)
                .font(.body)
                .foregroundStyle(.secondary)
                .lineSpacing(4)
        }
    }

    private var contactButton: some View {
        Button {
            guard let url = URL(string: "https://wa.me/55\(pet.contactPhone)") else { return }
            UIApplication.shared.open(url)
        } label: {
            HStack {
                Image(systemName: "message.fill")
                Text(String(format: String(localized: "detail.contact.button"), pet.contactName))
                    .fontWeight(.semibold)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(16)
            .background(Color("AppGreen"))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#Preview {
    NavigationStack {
        PetDetailView(pet: MockPets.pets[0])
    }
}
