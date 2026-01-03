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
        VStack(spacing: 16) {
            Image(systemName: "laptopcomputer")
                .imageScale(.large)
                .font(.system(size: 48))
                .foregroundStyle(.tint)
            Text("LG Gram Control Center")
                .font(.title2)
            Text("Use the menu bar icon to access controls")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(40)
    }
}

#Preview {
    ContentView()
}
