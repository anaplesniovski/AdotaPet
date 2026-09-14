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
                    
                    // header
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Olá! 🐾")
                                .font(.title2)
                                .foregroundColor(.secondary)
                            Text("Encontre um pet")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    // barra de busca
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                        TextField("Buscar por nome, raça ou cidade...", text: $viewModel.searchText)
                    }
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    // filtros por espécie
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(viewModel.speciesOptions, id: \.self) { species in
                                SpeciesFilterButton(
                                    title: species,
                                    isSelected: viewModel.selectedSpecies == species
                                ) {
                                    viewModel.selectedSpecies = species
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // lista de pets
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.filteredPets) { pet in
                            NavigationLink(value: pet) {
                                PetCardView(pet: pet)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
            .navigationBarHidden(true)
            .background(Color(.systemGroupedBackground))
            .navigationDestination(for: Pet.self) { pet in
                PetDetailView(pet: pet)
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(PetViewModel())
}
