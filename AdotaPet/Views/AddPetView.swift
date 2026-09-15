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
    @State private var species = PetSpecies.dog
    @State private var breed = ""
    @State private var age = ""
    @State private var gender = PetGender.male
    @State private var size = PetSize.medium
    @State private var description = ""
    @State private var vaccinated = false
    @State private var neutered = false
    @State private var contactName = ""
    @State private var contactPhone = ""
    @State private var city = ""
    @State private var showSuccess = false
    
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
                            Image(systemName: species.icon)
                                .font(.system(size: 60))
                                .foregroundColor(Color("AppGreen"))
                        )
                    
                    // infos básicas
                    GroupBox(label: Label(String(localized: "addpet.section.basic"), systemImage: "pawprint.fill").foregroundColor(Color("AppGreen"))) {
                        VStack(spacing: 12) {
                            CustomTextField(placeholder: String(localized: "addpet.field.name"), text: $name)
                            
                            Picker(String(localized: "addpet.field.species"), selection: $species) {
                                ForEach(PetSpecies.allCases, id: \.self) { option in
                                    Text(option.name).tag(option)
                                }
                            }
                            .pickerStyle(.segmented)
                            
                            CustomTextField(placeholder: String(localized: "addpet.field.breed"), text: $breed)
                            CustomTextField(placeholder: String(localized: "addpet.field.age"), text: $age)
                            
                            Picker(String(localized: "addpet.field.gender"), selection: $gender) {
                                ForEach(PetGender.allCases, id: \.self) { option in
                                    Text(option.label).tag(option)
                                }
                            }
                            .pickerStyle(.segmented)
                            
                            Picker(String(localized: "addpet.field.size"), selection: $size) {
                                ForEach(PetSize.allCases, id: \.self) { option in
                                    Text(option.description).tag(option)
                                }
                            }
                            .pickerStyle(.segmented)

                        }
                        .padding(.top, 8)
                    }
                    
                    // saúde
                    GroupBox(label: Label(String(localized: "addpet.section.health"), systemImage: "cross.circle.fill").foregroundColor(Color("AppGreen"))) {
                        VStack(spacing: 12) {
                            Toggle(String(localized: "detail.vaccinated"), isOn: $vaccinated)
                                .tint(Color("AppGreen"))
                            Divider()
                            Toggle(String(localized: "detail.neutered"), isOn: $neutered)
                                .tint(Color("AppGreen"))
                        }
                        .padding(.top, 8)
                    }
                    
                    // descrição
                    GroupBox(label: Label(String(localized: "addpet.section.description"), systemImage: "text.alignleft").foregroundColor(Color("AppGreen"))) {
                        TextEditor(text: $description)
                            .frame(height: 100)
                            .padding(4)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.top, 8)
                    }
                    
                    // contato
                    GroupBox(label: Label(String(localized: "addpet.section.contact"), systemImage: "phone.fill").foregroundColor(Color("AppGreen"))) {
                        VStack(spacing: 12) {
                            CustomTextField(placeholder: String(localized: "addpet.field.contactname"), text: $contactName)
                            CustomTextField(placeholder: String(localized: "addpet.field.phone"), text: $contactPhone)
                                .keyboardType(.phonePad)
                            CustomTextField(placeholder: String(localized: "addpet.field.city"), text: $city)
                        }
                        .padding(.top, 8)
                    }
                    
                    // btn salvar
                    Button(action: savePet) {
                        Text(String(localized: "addpet.button.save"))
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
            .navigationTitle(String(localized: "addpet.title"))
            .navigationBarTitleDisplayMode(.large)
            .background(Color(.systemGroupedBackground))
            .alert((String(localized: "addpet.alert.title")), isPresented: $showSuccess) {
                Button((String(localized: "addpet.alert.action"))) { resetForm() }
            } message: {
                Text(String(format: String(localized: "addpet.alert.message"), name))
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
        species = .dog
        breed = ""
        age = ""
        gender = .male
        size = .medium
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
