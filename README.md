# DynamicSheet

A modern iOS app demonstrating dynamic sheet presentations with beautiful animated backgrounds and interactive tray views.

## Overview

DynamicSheet is a SwiftUI-based iOS application that showcases advanced sheet presentation techniques with a focus on user experience and visual design. The app features a stunning animated glowing background and a custom tray system for mode and model selection.

## Features

### 🎨 Visual Design
- **Animated Glowing Background**: Multi-layered animated circles with radial gradients creating a dynamic, modern aesthetic
- **Custom Tray Presentation**: Smooth sheet presentations with custom styling and animations
- **Interactive UI Elements**: Pressable buttons with scale and opacity animations
- **Dark Theme**: Optimized for dark mode with carefully chosen color palette

### 🔧 Functionality
- **Mode Selection**: Choose between different AI-powered modes (Search, Research, Labs, Incognito)
- **Model Selection**: Select from various AI models (Best, Sonar, Claude, GPT-4, Gemini, Grok)
- **Toggle Controls**: Incognito mode toggle for privacy settings
- **Smooth Transitions**: Bouncy animations between different views and states

### 📱 User Experience
- **Intuitive Navigation**: Clear visual hierarchy and easy-to-understand interface
- **Responsive Design**: Adapts to different screen sizes and orientations
- **Accessibility**: Proper contrast ratios and readable typography
- **Performance**: Optimized animations using SwiftUI's drawing group

## Project Structure

```
DynamicSheet/
├── DynamicSheet/
│   ├── DynamicSheetApp.swift      # App entry point
│   ├── ContentView.swift          # Main UI and tray views
│   ├── Data.swift                 # Data models and constants
│   ├── TrayHelper.swift           # Custom sheet presentation helpers
│   └── Assets.xcassets/           # App icons and images
└── DynamicSheet.xcodeproj/        # Xcode project file
```

### Key Components

#### ContentView.swift
- **GlowingBackground**: Animated background with multiple gradient layers
- **ContentView**: Main app interface with launch button
- **TrayView**: Custom tray with mode and model selection
- **ModeSelectionView**: UI for selecting different modes
- **ModelSelectionView**: UI for selecting AI models

#### Data.swift
- **Mode**: Data structure for tray modes (Search, Research, Labs, Incognito)
- **AIModel**: Data structure for AI model options
- **modes**: Array of available modes
- **aiModels**: Array of available AI models

#### TrayHelper.swift
- **TrayConfig**: Configuration for custom sheet presentation
- **systemTrayView**: Extension for presenting custom tray sheets
- **RemoveSheetShadow**: Helper to remove default sheet shadows

## Technical Details

### Architecture
- **SwiftUI**: Modern declarative UI framework
- **MVVM Pattern**: Clean separation of data and presentation
- **Extensions**: Reusable UI components and helpers

### Animations
- **Easing Functions**: Custom easing for smooth transitions
- **Drawing Groups**: Performance optimization for complex animations
- **State Management**: Proper state handling for animations

### Color System
- **Hex Color Support**: Custom Color extension for hex values
- **Consistent Palette**: Carefully chosen colors for visual harmony
- **Opacity Management**: Proper transparency for layered effects

## Getting Started

### Prerequisites
- Xcode 15.0 or later
- iOS 17.0 or later
- macOS 14.0 or later (for development)

### Installation
1. Clone the repository:
   ```bash
   git clone git@github.com:gunnargray-dev/dynamic-sheet.git
   ```

2. Open the project in Xcode:
   ```bash
   open DynamicSheet.xcodeproj
   ```

3. Build and run the project:
   - Select your target device or simulator
   - Press `Cmd + R` to build and run

### Usage
1. Launch the app to see the animated background
2. Tap "Launch Sheet" to open the custom tray
3. Select a mode (Search, Research, Labs, or toggle Incognito)
4. Choose an AI model from the available options
5. Experience smooth transitions between different views

## Customization

### Adding New Modes
1. Update the `modes` array in `Data.swift`
2. Add corresponding icons to `Assets.xcassets`
3. The UI will automatically reflect the new modes

### Adding New AI Models
1. Update the `aiModels` array in `Data.swift`
2. Models will appear in the model selection view

### Modifying Animations
1. Adjust timing and easing in `GlowingBackground`
2. Modify transition animations in `TrayView`
3. Update button press animations in `PressableButtonStyle`

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built with SwiftUI and Xcode
- Inspired by modern iOS design patterns
- Special thanks to the SwiftUI community for best practices

## Contact

- **Developer**: Gunnar Gray
- **GitHub**: [@gunnargray-dev](https://github.com/gunnargray-dev)
- **Repository**: [dynamic-sheet](https://github.com/gunnargray-dev/dynamic-sheet)

---

Made with ❤️ using SwiftUI