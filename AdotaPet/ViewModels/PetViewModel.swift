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
    @Published var selectedSpecies: String = "Todos"
    
    let speciesOptions = ["Todos", "Cachorro", "Gato"]
    
    var filteredPets: [Pet] {
        pets.filter { pet in
            let matchesSpecies = selectedSpecies == "Todos" || pet.species == selectedSpecies
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
