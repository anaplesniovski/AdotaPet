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
    let species: String
    let breed: String
    let age: String
    let gender: String
    let size: String
    let description: String
    let temperament: [String]
    let vaccinated: Bool
    let neutered: Bool
    let contactName: String
    let contactPhone: String
    let imageName: String
    let city: String
}
