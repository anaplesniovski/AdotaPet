//
//  SplashView.swift
//  AdotaPet
//
//  Created by Ana Paula Lesniovski on 18/09/26.
//

import SwiftUI

struct SplashView: View {
    @State private var opacity = 0.0
    @State private var scale = 0.8
    @State private var isFinished = false

    var body: some View {
        if isFinished {
            TabBarView()
        } else {
            VStack(spacing: 16) {
                Image(systemName: "pawprint.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(Color("AppGreen"))

                Text("AdotaPet")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("AppGreen"))

                Text(String(localized: "splash.subtitle"))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .scaleEffect(scale)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeOut(duration: 0.6)) {
                    opacity = 1.0
                    scale = 1.0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.easeIn(duration: 0.3)) {
                        opacity = 0.0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        isFinished = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
