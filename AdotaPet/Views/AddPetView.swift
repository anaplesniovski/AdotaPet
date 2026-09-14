//
//  AddPetView.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 01/09/26.
//

import SwiftUI

struct AddPetView: View {
    @EnvironmentObject var viewModel: PetViewModel
    
    @State private var name = ""
    @State private var species = "Cachorro"
    @State private var breed = ""
    @State private var age = ""
    @State private var gender = "Macho"
    @State private var size = "Médio"
    @State private var description = ""
    @State private var vaccinated = false
    @State private var neutered = false
    @State private var contactName = ""
    @State private var contactPhone = ""
    @State private var city = ""
    @State private var showSuccess = false
    
    let speciesOptions = ["Cachorro", "Gato"]
    let genderOptions = ["Macho", "Fêmea"]
    let sizeOptions = ["Pequeno", "Médio", "Grande"]
    
    var isFormValid: Bool {
        !name.isEmpty && !breed.isEmpty && !age.isEmpty &&
        !description.isEmpty && !contactName.isEmpty &&
        !contactPhone.isEmpty && !city.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // ícone
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color("AppGreen").opacity(0.15))
                        .frame(height: 140)
                        .overlay(
                            Image(systemName: species == "Cachorro" ? "dog.fill" : "cat.fill")
                                .font(.system(size: 60))
                                .foregroundColor(Color("AppGreen"))
                        )
                    
                    // infos básicas
                    GroupBox(label: Label("Informações Básicas", systemImage: "pawprint.fill").foregroundColor(Color("AppGreen"))) {
                        VStack(spacing: 12) {
                            CustomTextField(placeholder: "Nome do pet", text: $name)
                            
                            Picker("Espécie", selection: $species) {
                                ForEach(speciesOptions, id: \.self) { Text($0) }
                            }
                            .pickerStyle(.segmented)
                            
                            CustomTextField(placeholder: "Raça", text: $breed)
                            CustomTextField(placeholder: "Idade (ex: 2 anos)", text: $age)
                            
                            Picker("Gênero", selection: $gender) {
                                ForEach(genderOptions, id: \.self) { Text($0) }
                            }
                            .pickerStyle(.segmented)
                            
                            Picker("Porte", selection: $size) {
                                ForEach(sizeOptions, id: \.self) { Text($0) }
                            }
                            .pickerStyle(.segmented)
                        }
                        .padding(.top, 8)
                    }
                    
                    // saúde
                    GroupBox(label: Label("Saúde", systemImage: "cross.circle.fill").foregroundColor(Color("AppGreen"))) {
                        VStack(spacing: 12) {
                            Toggle("Vacinado", isOn: $vaccinated)
                                .tint(Color("AppGreen"))
                            Divider()
                            Toggle("Castrado", isOn: $neutered)
                                .tint(Color("AppGreen"))
                        }
                        .padding(.top, 8)
                    }
                    
                    // descrição
                    GroupBox(label: Label("Descrição", systemImage: "text.alignleft").foregroundColor(Color("AppGreen"))) {
                        TextEditor(text: $description)
                            .frame(height: 100)
                            .padding(4)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.top, 8)
                    }
                    
                    // contato
                    GroupBox(label: Label("Contato", systemImage: "phone.fill").foregroundColor(Color("AppGreen"))) {
                        VStack(spacing: 12) {
                            CustomTextField(placeholder: "Seu nome", text: $contactName)
                            CustomTextField(placeholder: "WhatsApp (ex: 47999999999)", text: $contactPhone)
                                .keyboardType(.phonePad)
                            CustomTextField(placeholder: "Cidade - Estado", text: $city)
                        }
                        .padding(.top, 8)
                    }
                    
                    // btn salvar
                    Button(action: savePet) {
                        Text("Cadastrar Pet")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(16)
                            .background(isFormValid ? Color("AppGreen") : Color(.systemGray4))
                            .cornerRadius(16)
                    }
                    .disabled(!isFormValid)
                }
                .padding()
            }
            .navigationTitle("Cadastrar Pet")
            .navigationBarTitleDisplayMode(.large)
            .background(Color(.systemGroupedBackground))
            .alert("Pet cadastrado! 🐾", isPresented: $showSuccess) {
                Button("OK") { resetForm() }
            } message: {
                Text("\(name) foi adicionado com sucesso!")
            }
        }
    }
    
    private func savePet() {
        let newPet = Pet(
            name: name,
            species: species,
            breed: breed,
            age: age,
            gender: gender,
            size: size,
            description: description,
            temperament: [],
            vaccinated: vaccinated,
            neutered: neutered,
            contactName: contactName,
            contactPhone: contactPhone,
            imageName: "",
            city: city
        )
        viewModel.addPet(newPet)
        showSuccess = true
    }
    
    private func resetForm() {
        name = ""
        species = "Cachorro"
        breed = ""
        age = ""
        gender = "Macho"
        size = "Médio"
        description = ""
        vaccinated = false
        neutered = false
        contactName = ""
        contactPhone = ""
        city = ""
    }
}

#Preview {
    AddPetView()
        .environmentObject(PetViewModel())
}
