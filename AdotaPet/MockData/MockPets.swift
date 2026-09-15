//
//  MockPets.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 21/08/26.
//

import Foundation

struct MockPets {
    static let pets: [Pet] = [
        Pet(
            name: "Thor",
            species: .dog,
            breed: "Labrador",
            age: "2 anos",
            gender: .male,
            size: .large,
            description: "Thor é um cachorro muito dócil e brincalhão. Adora crianças e se dá bem com outros animais. Está vacinado e castrado.",
            temperament: ["Dócil", "Brincalhão", "Sociável"],
            vaccinated: true,
            neutered: true,
            contactName: "Ana Paula",
            contactPhone: "47999999999",
            imageName: "dog1",
            city: "Barra Velha - SC"
        ),
        Pet(
            name: "Luna",
            species: .cat,
            breed: "Vira-lata",
            age: "1 ano",
            gender: .female,
            size: .small,
            description: "Luna é uma gatinha muito carinhosa e tranquila. Ideal para apartamento. Já vacinada e castrada.",
            temperament: ["Carinhosa", "Tranquila", "Tímida"],
            vaccinated: true,
            neutered: true,
            contactName: "Carlos",
            contactPhone: "47988888888",
            imageName: "cat1",
            city: "Barra Velha - SC"
        ),
        Pet(
            name: "Bob",
            species: .dog,
            breed: "Vira-lata",
            age: "3 anos",
            gender: .male,
            size: .medium,
            description: "Bob é um cachorro alegre e cheio de energia. Adora passear e brincar. Vacinado e castrado.",
            temperament: ["Alegre", "Energético", "Leal"],
            vaccinated: true,
            neutered: true,
            contactName: "Marina",
            contactPhone: "47977777777",
            imageName: "dog2",
            city: "Barra Velha - SC"
        ),
        Pet(
            name: "Mel",
            species: .cat,
            breed: "Siamês",
            age: "4 anos",
            gender: .female,
            size: .small,
            description: "Mel é uma gata elegante e independente. Adora sol e lugares altos. Vacinada e castrada.",
            temperament: ["Independente", "Curiosa", "Elegante"],
            vaccinated: true,
            neutered: true,
            contactName: "João",
            contactPhone: "47966666666",
            imageName: "cat2",
            city: "Barra Velha - SC"
        ),
        Pet(
            name: "Rex",
            species: .dog,
            breed: "Pastor Alemão",
            age: "5 anos",
            gender: .male,
            size: .large,
            description: "Rex é um cachorro leal e protetor. Muito inteligente e fácil de treinar. Vacinado.",
            temperament: ["Leal", "Protetor", "Inteligente"],
            vaccinated: true,
            neutered: false,
            contactName: "Pedro",
            contactPhone: "47955555555",
            imageName: "dog3",
            city: "Barra Velha - SC"
        )
    ]
}
