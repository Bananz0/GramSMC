//
//  ContentView.swift
//  GramControlCenter
//
//  Created by Glen Muthoka on 01/01/2026.
//  Copyright © 2026 Glen Muthoka Mutinda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Main app uses GramControlCenterApp.swift with menu bar
        // This view is a placeholder for potential future windowed mode
        ZStack {
            VisualEffectBlur(material: .hudWindow, blendingMode: .behindWindow)
                .edgesIgnoringSafeArea(.all)
                .overlay(LGGlass.backdrop)

            VStack(spacing: 16) {
                Image(systemName: "laptopcomputer")
                    .imageScale(.large)
                    .font(.system(size: 48))
                    .foregroundStyle(LGGlass.accentGradient)
                Text("LG Gram Control Center")
                    .font(.title2)
                    .foregroundColor(LGColor.text)
                Text("Use the menu bar icon to access controls")
                    .font(LGFont.caption)
                    .foregroundColor(LGColor.textSecondary)
            }
            .padding(32)
            .background(
                LGGlassSurface(
                    cornerRadius: LGLayout.cornerRadius,
                    material: LGGlass.cardMaterial
                )
            )
        }
        .frame(width: 520, height: 360)
    }
}

#Preview {
    ContentView()
}
