//
//  PetForm.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 16/09/26.
//

import Foundation

struct PetForm {
    var name = ""
    var species = PetSpecies.dog
    var breed = ""
    var age = ""
    var gender = PetGender.male
    var size = PetSize.medium
    var description = ""
    var vaccinated = false
    var neutered = false
    var contactName = ""
    var contactPhone = ""
    var city = ""
    var imageData: Data? = nil

    var isValid: Bool {
        !name.isBlank && !breed.isBlank && !age.isBlank &&
        !description.isBlank && !contactName.isBlank &&
        !contactPhone.isBlank && !city.isBlank
    }

    func makePet() -> Pet {
        Pet(
            name: name.trimmed,
            species: species,
            breed: breed.trimmed,
            age: age.trimmed,
            gender: gender,
            size: size,
            description: description.trimmed,
            temperament: [],
            vaccinated: vaccinated,
            neutered: neutered,
            contactName: contactName.trimmed,
            contactPhone: contactPhone.trimmed,
            image: imageData.map { .data($0) },
            city: city.trimmed
        )
    }

    mutating func reset() {
        self = PetForm()
    }
}

private extension String {
    var isBlank: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
