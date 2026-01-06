//
//  DesignSystem.swift
//  GramControlCenter
//
//  LG Control Center-inspired design system
//  Copyright © 2026 Glen Muthoka Mutinda.
//

import SwiftUI

// MARK: - Color Palette

struct LGColor {
    // Primary Accent - LG Magenta/Red (Keep this as brand identity)
    static let magenta = Color(hex: 0xD20050)
    
    // Backgrounds - Use System Colors for Dark Mode Support
    static let background = Color.clear // Allow VisualEffectView to show through
    static let sectionBackground = Color(NSColor.controlBackgroundColor).opacity(0.5)
    static let cardBackground = Color(NSColor.windowBackgroundColor).opacity(0.6) // Semi-transparent for blur
    
    // Borders & Dividers
    static let border = Color(NSColor.separatorColor)
    
    // Text
    static let text = Color.primary
    static let textSecondary = Color.secondary
    
    // Interactive Accent
    static let accentPurple = Color(NSColor.controlAccentColor)
    
    // Status Colors
    static let statusGreen = Color.green
    static let statusRed = Color.red
    static let statusOrange = Color.orange
}

// MARK: - Typography

struct LGFont {
    // Main Headers: 24-28px, Light weight
    static func header(_ size: CGFloat = 24) -> Font {
        .system(size: size, weight: .light)
    }
    
    // Card Titles: 16px, Semi-bold
    static let cardTitle: Font = .system(size: 16, weight: .semibold)
    
    // Body Text: 13px, Regular
    static let body: Font = .system(size: 13, weight: .regular)
    
    // Labels: 11px, Regular
    static let caption: Font = .system(size: 11, weight: .regular)
    
    // Small Labels (Min/Max): 10px
    static let label: Font = .system(size: 10, weight: .medium)
}

// MARK: - Layout Constants

struct LGLayout {
    // Window Dimensions
    static let windowWidth: CGFloat = 800
    static let windowHeight: CGFloat = 500
    
    // Spacing
    static let padding: CGFloat = 20
    static let gutter: CGFloat = 10
    static let cardPadding: CGFloat = 16
    
    // Border Radius
    static let cornerRadius: CGFloat = 2
    
    // Component Sizes
    static let iconSize: CGFloat = 20
    static let headerHeight: CGFloat = 44
    static let sliderTrackHeight: CGFloat = 4
    static let toggleHeight: CGFloat = 24
}

// MARK: - Color Extension for Hex

extension Color {
    init(hex: UInt32, alpha: Double = 1.0) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}
