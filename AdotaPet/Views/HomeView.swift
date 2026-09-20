//
//  HomeView.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 27/08/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: PetViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    header
                    searchBar
                    speciesFilter
                    petList
                }
                .padding(.vertical)
            }
            .scrollDismissesKeyboard(.immediately)
            .navigationBarHidden(true)
            .background(Color(.systemGroupedBackground))
            .navigationDestination(for: Pet.self) { pet in
                PetDetailView(pet: pet)
            }
        }
    }

    // MARK: - Sections

    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(String(localized: "home.greeting"))
                    .font(.title2)
                    .foregroundStyle(.secondary)
                Text(String(localized: "home.title"))
                    .font(.title)
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .padding(.horizontal)
    }

    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
            TextField(String(localized: "home.search.placeholder"), text: $viewModel.searchText)
                .submitLabel(.search)
        }
        .padding(12)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }

    private var speciesFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                SpeciesFilterButton(
                    title: String(localized: "filter.all"),
                    isSelected: viewModel.selectedSpecies == nil
                ) {
                    viewModel.selectedSpecies = nil
                }

                ForEach(viewModel.speciesOptions, id: \.self) { species in
                    SpeciesFilterButton(
                        title: species.name,
                        isSelected: viewModel.selectedSpecies == species
                    ) {
                        viewModel.selectedSpecies = species
                    }
                }
            }
            .padding(.horizontal)
        }
    }

    private var petList: some View {
        Group {
            if viewModel.filteredPets.isEmpty {
                EmptyStateView()
            } else {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.filteredPets) { pet in
                        NavigationLink(value: pet) {
                            PetCardView(pet: pet)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(PetViewModel())
}
