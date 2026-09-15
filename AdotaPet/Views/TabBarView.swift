//
//  TabBarView.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 23/08/26.
//

import SwiftUI

struct TabBarView: View {
    @StateObject private var viewModel = PetViewModel()
    
    var body: some View {
        TabView {
            HomeView()
                .environmentObject(viewModel)
                .tabItem {
                    Label(String(localized: "tabbar.home"), systemImage: "house.fill")
                }
            
            AddPetView()
                .environmentObject(viewModel)
                .tabItem {
                    Label(String(localized: "tabbar.register"), systemImage: "plus.circle.fill")
                }
        }
        .accentColor(Color("AppGreen"))
    }
}

#Preview {
    TabBarView()
}
