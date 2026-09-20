//
//  AddPetView.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 01/09/26.
//

import SwiftUI
import PhotosUI

struct AddPetView: View {
    @EnvironmentObject var viewModel: PetViewModel
    @Binding var selectedTab: Int

    @State private var form = PetForm()
    @State private var showSuccess = false
    @State private var selectedPhoto: PhotosPickerItem? = nil

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    petIcon
                    basicInfoSection
                    healthSection
                    descriptionSection
                    contactSection
                    saveButton
                }
                .padding()
            }
            .navigationTitle(String(localized: "addpet.title"))
            .navigationBarTitleDisplayMode(.large)
            .background(Color(.systemGroupedBackground))
            .alert(String(localized: "addpet.alert.title"), isPresented: $showSuccess) {
                Button(String(localized: "addpet.alert.action")) {
                    form.reset()
                    selectedPhoto = nil
                    selectedTab = 0
                }
            } message: {
                Text(String(format: String(localized: "addpet.alert.message"), form.name))
            }
        }
    }

    // MARK: - Sections

    private var petIcon: some View {
        PhotosPicker(selection: $selectedPhoto, matching: .images) {
            if let imageData = form.imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 140)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
            } else {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color("AppGreen").opacity(0.15))
                    .frame(height: 140)
                    .overlay {
                        VStack(spacing: 8) {
                            Image(systemName: form.species.icon)
                                .font(.system(size: 50))
                                .foregroundStyle(Color("AppGreen"))
                            Text(String(localized: "addpet.photo.placeholder"))
                                .font(.caption)
                                .foregroundStyle(Color("AppGreen"))
                        }
                    }
            }
        }
        .onChange(of: selectedPhoto) { _, newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    form.imageData = data
                }
            }
        }
    }

    private var basicInfoSection: some View {
        GroupBox {
            VStack(spacing: 12) {
                CustomTextField(placeholder: String(localized: "addpet.field.name"), text: $form.name)

                Picker(String(localized: "addpet.field.species"), selection: $form.species) {
                    ForEach(PetSpecies.allCases, id: \.self) { option in
                        Text(option.name).tag(option)
                    }
                }
                .pickerStyle(.segmented)

                CustomTextField(placeholder: String(localized: "addpet.field.breed"), text: $form.breed)
                CustomTextField(placeholder: String(localized: "addpet.field.age"), text: $form.age)

                Picker(String(localized: "addpet.field.gender"), selection: $form.gender) {
                    ForEach(PetGender.allCases, id: \.self) { option in
                        Text(option.label).tag(option)
                    }
                }
                .pickerStyle(.segmented)

                Picker(String(localized: "addpet.field.size"), selection: $form.size) {
                    ForEach(PetSize.allCases, id: \.self) { option in
                        Text(option.description).tag(option)
                    }
                }
                .pickerStyle(.segmented)
            }
            .padding(.top, 8)
        } label: {
            sectionLabel("addpet.section.basic", systemImage: "pawprint.fill")
        }
    }

    private var healthSection: some View {
        GroupBox {
            VStack(spacing: 12) {
                Toggle(String(localized: "detail.vaccinated"), isOn: $form.vaccinated)
                    .tint(Color("AppGreen"))
                Divider()
                Toggle(String(localized: "detail.neutered"), isOn: $form.neutered)
                    .tint(Color("AppGreen"))
            }
            .padding(.top, 8)
        } label: {
            sectionLabel("addpet.section.health", systemImage: "cross.circle.fill")
        }
    }

    private var descriptionSection: some View {
        GroupBox {
            TextEditor(text: $form.description)
                .frame(height: 100)
                .padding(4)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.top, 8)
        } label: {
            sectionLabel("addpet.section.description", systemImage: "text.alignleft")
        }
    }

    private var contactSection: some View {
        GroupBox {
            VStack(spacing: 12) {
                CustomTextField(placeholder: String(localized: "addpet.field.contactname"), text: $form.contactName)
                CustomTextField(placeholder: String(localized: "addpet.field.phone"), text: $form.contactPhone)
                    .keyboardType(.phonePad)
                CustomTextField(placeholder: String(localized: "addpet.field.city"), text: $form.city)
            }
            .padding(.top, 8)
        } label: {
            sectionLabel("addpet.section.contact", systemImage: "phone.fill")
        }
    }

    private var saveButton: some View {
        Button(action: savePet) {
            Text(String(localized: "addpet.button.save"))
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(16)
                .background(form.isValid ? Color("AppGreen") : Color(.systemGray4))
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .disabled(!form.isValid)
    }

    // MARK: - Helpers

    private func sectionLabel(_ key: LocalizedStringKey, systemImage: String) -> some View {
        Label(key, systemImage: systemImage)
            .foregroundStyle(Color("AppGreen"))
    }

    private func savePet() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        viewModel.addPet(form.makePet())
        showSuccess = true
    }
}

#Preview {
    AddPetView(selectedTab: .constant(1))
        .environmentObject(PetViewModel())
}
