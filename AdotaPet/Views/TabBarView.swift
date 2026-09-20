//
//  TabBarView.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 23/08/26.
//

import SwiftUI

struct TabBarView: View {
    @StateObject private var viewModel = PetViewModel()
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .environmentObject(viewModel)
                .tabItem {
                    Label(String(localized: "tabbar.home"), systemImage: "house.fill")
                }
                .tag(0)

            AddPetView(selectedTab: $selectedTab)
                .environmentObject(viewModel)
                .tabItem {
                    Label(String(localized: "tabbar.register"), systemImage: "plus.circle.fill")
                }
                .tag(1)
        }
        .tint(Color("AppGreen"))
    }
}

#Preview {
    TabBarView()
}
