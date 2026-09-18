//
//  Pet.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 20/08/26.
//

import Foundation

struct Pet: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let species: PetSpecies
    let breed: String
    let age: String
    let gender: PetGender
    let size: PetSize
    let description: String
    let temperament: [String]
    let vaccinated: Bool
    let neutered: Bool
    let contactName: String
    let contactPhone: String
    let image: PetImage?
    let city: String
}
