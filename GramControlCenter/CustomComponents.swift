//
//  CustomComponents.swift
//  GramControlCenter
//
//  LG Control Center-styled custom SwiftUI components
//  Copyright © 2026 Glen Muthoka Mutinda.
//

import SwiftUI

// MARK: - VisualEffectBlur (Native macOS Blur)

struct VisualEffectBlur: NSViewRepresentable {
    var material: NSVisualEffectView.Material
    var blendingMode: NSVisualEffectView.BlendingMode
    var state: NSVisualEffectView.State = .active
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.material = material
        view.blendingMode = blendingMode
        view.state = state
        return view
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        nsView.material = material
        nsView.blendingMode = blendingMode
        nsView.state = state
    }
}

// MARK: - LGGlassSurface (Liquid Glass Background)

struct LGGlassSurface: View {
    let cornerRadius: CGFloat
    let material: Material
    var showsShadow: Bool = true

    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .fill(material)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(LGColor.glassBase)
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(LGColor.border, lineWidth: 1)
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(LGGlass.highlight, lineWidth: 1)
                    .blendMode(.screen)
            )
            .shadow(color: showsShadow ? LGGlass.shadow : .clear, radius: 12, x: 0, y: 6)
    }
}

// MARK: - LGCard (Container with Blur Support)

struct LGCard<Content: View>: View {
    let title: String
    let icon: String
    let content: Content
    
    init(title: String, icon: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.icon = icon
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Card Header
            HStack(spacing: 6) {
                if let customIcon = NSImage(named: icon) {
                    Image(nsImage: customIcon)
                        .resizable()
                        .frame(width: 14, height: 14)
                        .foregroundColor(LGColor.magenta)
                } else {
                    Image(systemName: icon)
                        .foregroundColor(LGColor.magenta)
                        .font(.system(size: 14))
                }
                Text(title)
                    .font(LGFont.cardTitle)
                    .foregroundColor(LGColor.text)
                    .lineLimit(1)
            }
            
            Divider()
                .background(LGColor.glassDivider)
            
            // Card Content
            content
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(
            LGGlassSurface(
                cornerRadius: LGLayout.cornerRadius,
                material: LGGlass.cardMaterial
            )
        )
    }
}

// MARK: - LGSegmentedControl

struct LGSegmentedControl<T: Hashable>: View {
    let options: [(T, String)]
    @Binding var selection: T
    let isEnabled: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(options.enumerated()), id: \.offset) { index, option in
                Button(action: {
                    if isEnabled {
                        selection = option.0
                    }
                }) {
                    Text(option.1)
                        .font(LGFont.body)
                        .foregroundColor(selection == option.0 ? .white : LGColor.textSecondary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: LGLayout.segmentInnerRadius, style: .continuous)
                                .fill(selection == option.0
                                    ? AnyShapeStyle(LGGlass.accentGradient)
                                    : AnyShapeStyle(Color.clear)
                                )
                        )
                }
                .buttonStyle(.plain)
                .contentShape(Rectangle())
                
                if index < options.count - 1 {
                    Divider()
                        .frame(height: 20)
                        .background(LGColor.glassDivider)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(2)
        .background(
            LGGlassSurface(
                cornerRadius: LGLayout.segmentCornerRadius,
                material: LGGlass.controlMaterial,
                showsShadow: false
            )
        )
        .opacity(isEnabled ? 1.0 : 0.5)
    }
}

// MARK: - LGToggle (Pill-shaped Switch)

struct LGToggleStyle: ToggleStyle {
    var isEnabled: Bool = true
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            
            ZStack {
                // Track
                Capsule()
                    .fill(configuration.isOn
                        ? AnyShapeStyle(LGGlass.accentGradient)
                        : AnyShapeStyle(LGGlass.controlMaterial)
                    )
                    .overlay(
                        Capsule()
                            .stroke(LGColor.border, lineWidth: 1)
                    )
                    .overlay(
                        Capsule()
                            .stroke(LGGlass.highlight, lineWidth: 1)
                            .blendMode(.screen)
                            .opacity(0.5)
                    )
                    .frame(width: 44, height: 24)
                
                // Thumb
                Circle()
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.15), radius: 2, x: 0, y: 1)
                    .frame(width: 20, height: 20)
                    .offset(x: configuration.isOn ? 10 : -10)
                    .animation(.easeInOut(duration: 0.15), value: configuration.isOn)
            }
            .onTapGesture {
                if isEnabled {
                    configuration.isOn.toggle()
                }
            }
        }
        .opacity(isEnabled ? 1.0 : 0.5)
    }
}

// MARK: - LGGlassButtonStyle

struct LGGlassButtonStyle: ButtonStyle {
    var isPrimary: Bool = false

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(LGFont.body)
            .foregroundColor(isPrimary ? .white : LGColor.text)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: LGLayout.segmentInnerRadius, style: .continuous)
                    .fill(isPrimary
                        ? AnyShapeStyle(LGGlass.accentGradient)
                        : AnyShapeStyle(LGGlass.controlMaterial)
                    )
            )
            .overlay(
                RoundedRectangle(cornerRadius: LGLayout.segmentInnerRadius, style: .continuous)
                    .stroke(LGColor.border, lineWidth: 1)
            )
            .overlay(
                RoundedRectangle(cornerRadius: LGLayout.segmentInnerRadius, style: .continuous)
                    .stroke(LGGlass.highlight, lineWidth: 1)
                    .blendMode(.screen)
                    .opacity(isPrimary ? 0.6 : 0.35)
            )
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
}

// MARK: - LGSlider

struct LGSlider: View {
    @Binding var value: Double
    let range: ClosedRange<Double>
    let step: Double
    let label: String
    let minLabel: String
    let maxLabel: String
    let isEnabled: Bool
    
    init(
        value: Binding<Double>,
        in range: ClosedRange<Double> = 0...100,
        step: Double = 1,
        label: String = "",
        minLabel: String = "0",
        maxLabel: String = "100",
        isEnabled: Bool = true
    ) {
        self._value = value
        self.range = range
        self.step = step
        self.label = label
        self.minLabel = minLabel
        self.maxLabel = maxLabel
        self.isEnabled = isEnabled
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if !label.isEmpty {
                HStack {
                    Text(label)
                        .font(LGFont.body)
                        .foregroundColor(LGColor.text)
                    Spacer()
                    Text("\(Int(value))")
                        .font(LGFont.body)
                        .foregroundColor(LGColor.magenta)
                }
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Background Track
                    Capsule()
                        .fill(LGColor.border)
                        .frame(height: LGLayout.sliderTrackHeight)
                    
                    // Filled Track
                    Capsule()
                        .fill(LGGlass.accentGradient)
                        .frame(width: filledWidth(totalWidth: geometry.size.width), height: LGLayout.sliderTrackHeight)
                    
                    // Thumb
                    Circle()
                        .fill(Color.white)
                        .overlay(
                            Circle()
                                .fill(LGColor.magenta)
                                .frame(width: 6, height: 6)
                        )
                        .overlay(
                            Circle()
                                .stroke(LGColor.border, lineWidth: 1)
                        )
                        .frame(width: 20, height: 20)
                        .offset(x: thumbOffset(totalWidth: geometry.size.width))
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if isEnabled {
                                        updateValue(at: gesture.location.x, totalWidth: geometry.size.width)
                                    }
                                }
                        )
                }
            }
            .frame(height: 20)
            
            // Min/Max Labels
            HStack {
                Text(minLabel)
                    .font(LGFont.label)
                    .foregroundColor(LGColor.textSecondary)
                Spacer()
                Text(maxLabel)
                    .font(LGFont.label)
                    .foregroundColor(LGColor.textSecondary)
            }
        }
        .opacity(isEnabled ? 1.0 : 0.5)
    }
    
    private func filledWidth(totalWidth: CGFloat) -> CGFloat {
        let percentage = (value - range.lowerBound) / (range.upperBound - range.lowerBound)
        return max(0, min(totalWidth, CGFloat(percentage) * totalWidth))
    }
    
    private func thumbOffset(totalWidth: CGFloat) -> CGFloat {
        let percentage = (value - range.lowerBound) / (range.upperBound - range.lowerBound)
        return CGFloat(percentage) * (totalWidth - 20)
    }
    
    private func updateValue(at x: CGFloat, totalWidth: CGFloat) {
        let percentage = max(0, min(1, x / totalWidth))
        let newValue = range.lowerBound + percentage * (range.upperBound - range.lowerBound)
        let steppedValue = (newValue / step).rounded() * step
        value = max(range.lowerBound, min(range.upperBound, steppedValue))
    }
}

// MARK: - LGControlRow (Label + Control)

struct LGControlRow<Control: View>: View {
    let title: String
    let subtitle: String?
    let icon: String
    let control: Control
    
    init(
        title: String,
        subtitle: String? = nil,
        icon: String,
        @ViewBuilder control: () -> Control
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.control = control()
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            // Icon
            if let customIcon = NSImage(named: icon) {
                Image(nsImage: customIcon)
                    .resizable()
                    .frame(width: LGLayout.iconSize, height: LGLayout.iconSize)
            } else {
                Image(systemName: icon)
                    .foregroundColor(LGColor.magenta)
                    .font(.system(size: 16))
                    .frame(width: LGLayout.iconSize, height: LGLayout.iconSize)
            }
            
            // Labels
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(LGFont.body)
                    .foregroundColor(LGColor.text)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(LGFont.caption)
                        .foregroundColor(LGColor.textSecondary)
                }
            }
            
            Spacer()
            
            // Control
            control
        }
    }
}

// MARK: - LGStatusCard (For CPU/Fan Status)

struct LGStatusCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            if let customIcon = NSImage(named: icon) {
                Image(nsImage: customIcon)
                    .resizable()
                    .frame(width: 28, height: 28)
            } else {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(color)
            }
            
            Text(value)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(LGColor.text)
            
            Text(title)
                .font(LGFont.caption)
                .foregroundColor(LGColor.textSecondary)
        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .background(
            LGGlassSurface(
                cornerRadius: LGLayout.cornerRadius,
                material: LGGlass.cardMaterial,
                showsShadow: false
            )
        )
    }
}
