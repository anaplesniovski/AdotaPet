//
//  PetAttributes.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 15/09/26.
//

import Foundation

enum PetSpecies: String, CaseIterable, Hashable {
    case dog = "filter.dog"
    case cat = "filter.cat"
    
    var name: String {
        String(localized: String.LocalizationValue(self.rawValue))
    }
    
    var icon: String {
        switch self {
        case .dog: return "dog.fill"
        case .cat: return "cat.fill"
        }
    }
}

enum PetGender: String, CaseIterable, Hashable {
    case male = "addpet.gender.male"
    case female = "addpet.gender.female"
    
    var label: String {
        String(localized: String.LocalizationValue(self.rawValue))
    }
}

enum PetSize: String, CaseIterable, Hashable {
    case small = "addpet.size.small"
    case medium = "addpet.size.medium"
    case large = "addpet.size.large"
    
    var description: String {
        String(localized: String.LocalizationValue(self.rawValue))
    }
}
