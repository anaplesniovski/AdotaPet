//
//  PetViewModel.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 22/08/26.
//

import Combine
import Foundation

class PetViewModel: ObservableObject {
    @Published var pets: [Pet] = MockPets.pets
    @Published var searchText: String = ""
    @Published var selectedSpecies: String = ""
    
    let allOption = String(localized: "filter.all")
    
    let speciesOptions = [
        String(localized: "filter.all"),
        String(localized: "filter.dog"),
        String(localized: "filter.cat")
    ]
    
    init() {
        selectedSpecies = allOption
    }
    
    var filteredPets: [Pet] {
        pets.filter { pet in
            let matchesSpecies = selectedSpecies == allOption || pet.species == selectedSpecies
            let matchesSearch = searchText.isEmpty ||
                pet.name.localizedCaseInsensitiveContains(searchText) ||
                pet.breed.localizedCaseInsensitiveContains(searchText) ||
                pet.city.localizedCaseInsensitiveContains(searchText)
            return matchesSpecies && matchesSearch
        }
    }
    
    func addPet(_ pet: Pet) {
        pets.append(pet)
    }
}
