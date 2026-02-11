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

    // Backgrounds - Glass-friendly tints layered over materials
    static let background = Color.clear
    static let glassBase = Color.white.opacity(0.06)
    static let glassStrong = Color.white.opacity(0.12)
    static let footerBackground = Color.white.opacity(0.08)

    // Borders & Dividers
    static let border = Color(NSColor.separatorColor).opacity(0.6)
    static let glassDivider = Color.white.opacity(0.18)

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

// MARK: - Glass Materials & Effects

struct LGGlass {
    static let windowMaterial: Material = .regular
    static let cardMaterial: Material = .thin
    static let popoverMaterial: Material = .ultraThin
    static let controlMaterial: Material = .ultraThin
    static let footerMaterial: Material = .thin

    static let highlight = LinearGradient(
        colors: [Color.white.opacity(0.55), Color.white.opacity(0.12), Color.clear],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let backdrop = LinearGradient(
        colors: [Color.white.opacity(0.14), Color.clear, Color.white.opacity(0.06)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let accentGradient = LinearGradient(
        colors: [Color(hex: 0xD20050).opacity(0.95), Color(hex: 0xA90043).opacity(0.95)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let shadow = Color.black.opacity(0.18)
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
    static let windowHeight: CGFloat = 520

    // Spacing
    static let padding: CGFloat = 16
    static let gutter: CGFloat = 8
    static let cardPadding: CGFloat = 12

    // Border Radius
    static let cornerRadius: CGFloat = 10
    static let segmentCornerRadius: CGFloat = 8
    static let segmentInnerRadius: CGFloat = 6

    // Component Sizes
    static let iconSize: CGFloat = 18
    static let headerHeight: CGFloat = 32
    static let sliderTrackHeight: CGFloat = 3
    static let toggleHeight: CGFloat = 22
    
    // Menu popover
    static let menuWidth: CGFloat = 340
    static let menuHeight: CGFloat = 480
    static let menuPadding: CGFloat = 8
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
