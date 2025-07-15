// MARK: - Imports
import SwiftUI

// MARK: - View State Enum
/// Enum to track which view is currently shown in the tray (mode selection or model selection)
enum CurrentView {
    case modes
    case models
}

// MARK: - Glowing Background View
/// Animated glowing background for the main app window
struct GlowingBackground: View {
    @State private var animateGlow = false
    
    var body: some View {
        ZStack {
            // Base dark background
            Color.black
            
            // Animated glow layers
            ZStack {
                // Main central glow - more exaggerated
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(hex: "#1FB8CD").opacity(0.3),
                                Color(hex: "#1FB8CD").opacity(0.18),
                                Color(hex: "#0D7A8A").opacity(0.12),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 500
                        )
                    )
                    .frame(width: 1000, height: 1000)
                    .blur(radius: 60)
                    .scaleEffect(animateGlow ? 1.4 : 0.6)
                    .opacity(animateGlow ? 1.0 : 0.3)
                    .animation(.easeInOut(duration: 3).repeatForever(autoreverses: true), value: animateGlow)
                
                // Secondary glow - top left - more dramatic
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(hex: "#13A3B8").opacity(0.25),
                                Color(hex: "#1FB8CD").opacity(0.12),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 300
                        )
                    )
                    .frame(width: 600, height: 600)
                    .blur(radius: 50)
                    .offset(x: -200, y: -300)
                    .scaleEffect(animateGlow ? 0.7 : 1.3)
                    .opacity(animateGlow ? 0.8 : 0.4)
                    .animation(.easeInOut(duration: 4).repeatForever(autoreverses: true), value: animateGlow)
                
                // Tertiary glow - bottom right - more intense
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(hex: "#0B6B7A").opacity(0.22),
                                Color(hex: "#13A3B8").opacity(0.14),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 250
                        )
                    )
                    .frame(width: 500, height: 500)
                    .blur(radius: 45)
                    .offset(x: 180, y: 200)
                    .scaleEffect(animateGlow ? 1.3 : 0.7)
                    .opacity(animateGlow ? 0.6 : 0.9)
                    .animation(.easeInOut(duration: 5).repeatForever(autoreverses: true), value: animateGlow)
                
                // Accent glow - floating - more dramatic movement
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(hex: "#2DD4E8").opacity(0.2),
                                Color(hex: "#1FB8CD").opacity(0.1),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 180
                        )
                    )
                    .frame(width: 360, height: 360)
                    .blur(radius: 40)
                    .offset(x: animateGlow ? 150 : -150, y: animateGlow ? -150 : 150)
                    .scaleEffect(animateGlow ? 1.5 : 0.5)
                    .opacity(animateGlow ? 0.7 : 0.3)
                    .animation(.easeInOut(duration: 6).repeatForever(autoreverses: true), value: animateGlow)
                
                // Additional intense glow - center pulsing
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(hex: "#4AE5F5").opacity(0.15),
                                Color(hex: "#2DD4E8").opacity(0.08),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 200
                        )
                    )
                    .frame(width: 400, height: 400)
                    .blur(radius: 35)
                    .scaleEffect(animateGlow ? 1.6 : 0.4)
                    .opacity(animateGlow ? 0.8 : 0.2)
                    .animation(.easeInOut(duration: 2.5).repeatForever(autoreverses: true), value: animateGlow)
            }
            .drawingGroup()
            
            // Subtle noise texture overlay
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.02),
                            Color.clear,
                            Color.white.opacity(0.01)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .blendMode(.overlay)
        }
        .onAppear {
            animateGlow = true
        }
    }
}

// MARK: - Main Content View
/// Main app content view, including the glowing background and launch button
struct ContentView: View {
    /// View Properties
    @State private var show: Bool = false
    
    var body: some View {
        ZStack {
            // Cool glowing background
            GlowingBackground()
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header section
                VStack(spacing: 16) {
                    // App icon/logo area
                    ZStack {
                        Circle()
                            .fill(.ultraThinMaterial)
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "inset.filled.bottomthird.square")
                            .font(.system(size: 32, weight: .medium))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 60)
                    
                    // Title and subtitle
                    VStack(spacing: 8) {
                        Text("Dynamic Sheet")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("Transition between different views")
                            .font(.system(size: 16))
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 40)
                
                
                // Main action button
                VStack(spacing: 24) {
                    Button(action: {
                        show.toggle()
                    }) {
                        HStack(spacing: 12) {
                            Image(systemName: "inset.filled.bottomthird.square")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.white)
                            
                            Text("Launch Sheet")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 56)
                        .frame(height: 56)
                        .background(
                            LinearGradient(
                                colors: [
                                    Color(hex: "#1FB8CD"),
                                    Color(hex: "#13A3B8")
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: Color(hex: "#1FB8CD").opacity(0.3), radius: 12, x: 0, y: 4)
                        
                    }
                    .buttonStyle(PressableButtonStyle())
                    .scaleEffect(show ? 0.95 : 1.0)
                    .animation(.easeInOut(duration: 0.1), value: show)
                    
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 100)
            }
            .blur(radius: show ? 4 : 0)
            .scaleEffect(show ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: show)
            
            // Blur overlay
            if show {
                Color.black.opacity(0.1)
                    .ignoresSafeArea()
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.15), value: show)
            }
        }
        // Custom tray sheet modifier
        .systemTrayView($show) {
            TrayView()
        }
    }
}

// MARK: - Tray View
/// The main tray view, containing mode and model selection flows
struct TrayView: View {
    @State private var currentView: CurrentView = .modes
    @State private var selectedMode: Mode = modes.first { $0.title == "Search" }!
    @State private var selectedModel: AIModel = aiModels.first { $0.isSelected } ?? aiModels[0]
    @State private var incognitoEnabled: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                switch currentView {
                case .modes:
                    ModeSelectionView()
                        .transition(.blurReplace(.upUp))
                case .models:
                    ModelSelectionView()
                        .transition(.blurReplace(.downUp))
                }
            }
            .compositingGroup()
        }
        .padding(16)
    }
    
    /// Mode Selection View: lets user pick a mode and model
    @ViewBuilder
    func ModeSelectionView() -> some View {
        VStack(spacing: 16) {
            // Header
            HStack {
                Text("Choose a mode")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .frame(width: 32, height: 32)
                        .background(Color.clear)
                        .clipShape(Circle())
                }
            }
            .padding(.bottom, 8)
            
            // Mode Options
            VStack(spacing: 8) {
                ForEach(modes.filter { !$0.isToggle }) { mode in
                    ModeRowView(mode: mode)
                }
            }
            
            // Model Selection Section
            VStack(alignment: .leading, spacing: 8) {
                // Model title - outside container
                Text("Model")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 16)
                
                // Model Selection Row
                ModelSelectionRowView()
            }
            .padding(.top, 8)
            .padding(.bottom, 16)
        }
    }
    
    /// Model Selection View: lets user pick an AI model
    @ViewBuilder
    func ModelSelectionView() -> some View {
        VStack(spacing: 16) {
            // Header
            HStack {
                Text("Models")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                
                Spacer()
                
                Button {
                    withAnimation(.bouncy) {
                        currentView = .modes
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .frame(width: 32, height: 32)
                        .background(Color.clear)
                        .clipShape(Circle())
                }
            }
            .padding(.bottom, 8)
            
            ScrollView {
                VStack(spacing: 8) {
                    // All Models
                    ForEach(aiModels.filter { !$0.isReasoningModel }) { model in
                        ModelRowView(model: model)
                    }
                }
            }
        }
    }
    
    /// Row for each mode option
    @ViewBuilder
    func ModeRowView(mode: Mode) -> some View {
        let isSelected = selectedMode.id == mode.id
        
        Button(action: {
            if !mode.isToggle {
                // Delay state changes to allow press animation to complete
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    withAnimation(.bouncy) {
                        selectedMode = mode
                    }
                }
            }
        }) {
            HStack(alignment: .top, spacing: 12) {
            // Icon
            Image(mode.icon)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
                .foregroundColor(.white)
                .padding(.top, 3) // Align with the first line of text
            
            // Content
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .center, spacing: 6) {
                    // Main content area - tappable for mode selection
                    HStack(spacing: 6) {
                        Text(mode.title)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                    }

                    
                    Spacer(minLength: 0)
                    
                    // Right Side Control - only toggle for incognito
                    if mode.isToggle {
                        Toggle("", isOn: $incognitoEnabled)
                            .labelsHidden()
                    }
                }
                
                Text(mode.subtitle)
                    .font(.system(size: 12))
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .background(
            Group {
                if mode.isToggle {
                    Color.clear
                } else {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(isSelected ? Color(hex: "#13343B").opacity(0.3) : Color.white.opacity(0.02))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(isSelected ? Color(hex: "#1FB8CD") : Color.white.opacity(0.08), lineWidth: 1)
                        )
                }
            }
        )
        }
        .buttonStyle(PressableButtonStyle())
        .disabled(mode.isToggle)
    }
    
    /// Row for model selection (shows currently selected model)
    @ViewBuilder
    func ModelSelectionRowView() -> some View {
        Button(action: {
            // Delay state changes to allow press animation to complete
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                withAnimation(.bouncy) {
                    currentView = .models
                }
            }
        }) {
            HStack(spacing: 12) {
                // Chip icon + model name
                HStack(spacing: 8) {
                    Image(systemName: "cpu")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                    
                    Text(getDisplayModelName())
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                // Chevron
                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.white.opacity(0.6))
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.02))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white.opacity(0.08), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(PressableButtonStyle())
    }
    
    /// Row for each model option in the model selection view
    @ViewBuilder
    func ModelRowView(model: AIModel) -> some View {
        let isSelected = selectedModel.id == model.id
        
        Button(action: {
            // Delay state changes to allow press animation to complete
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                withAnimation(.snappy) {
                    selectedModel = model
                    
                    // Auto-navigate back to modes view after selection
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.bouncy) {
                            currentView = .modes
                        }
                    }
                }
            }
        }) {
            HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(model.title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                
                Text(model.subtitle)
                    .font(.system(size: 12))
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            if isSelected {
                Image(systemName: "checkmark")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color(hex: "#1FB8CD"))
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.02))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white.opacity(0.08), lineWidth: 1)
                )
        )
        }
        .buttonStyle(PressableButtonStyle())
    }
    
    /// Helper function to get display name for the selected model (shortens some names)
    private func getDisplayModelName() -> String {
        switch selectedModel.title {
        case "Claude 3.7 Sonnet":
            return "Claude 3.7"
        case "Claude 3.7 Sonnet Thinking":
            return "Claude 3.7 Thinking"
        default:
            return selectedModel.title
        }
    }
}

// MARK: - SwiftUI Preview
// SwiftUI preview for ContentView
#Preview {
    ContentView()
}

// MARK: - Pressable Button Style
// Custom button style for press interactions (scales and fades on press)
struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .animation(.easeInOut(duration: 0.05), value: configuration.isPressed)
    }
}

// MARK: - Color Hex Extension
// Helper extension for creating Color from hex string
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
