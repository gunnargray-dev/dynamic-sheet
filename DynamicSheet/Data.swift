// MARK: - Imports
import SwiftUI

// MARK: - Mode Model
/// Represents a selectable mode in the tray (e.g., Search, Research, Labs, Incognito)
struct Mode: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var icon: String
    var title: String
    var subtitle: String
    var isPro: Bool = false
    var isToggle: Bool = false
}

// MARK: - Modes List
/// List of available modes for the tray UI
let modes: [Mode] = [
    .init(icon: "icon-search", title: "Search", subtitle: "Fast answers to everyday questions", isPro: true),
    .init(icon: "icon-research", title: "Research", subtitle: "Deep research on any topic", isPro: true),
    .init(icon: "icon-labs", title: "Labs", subtitle: "Create projects from scratch", isPro: true),
    .init(icon: "icon-incognito", title: "Incognito mode", subtitle: "Activity won't be saved", isToggle: true)
]

// MARK: - AI Model
/// Represents an AI model option for the user to select
struct AIModel: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var subtitle: String
    var isSelected: Bool = false
    var isReasoningModel: Bool = false
}

// MARK: - AI Models List
/// List of available AI models for the tray UI
let aiModels: [AIModel] = [
    .init(title: "Best", subtitle: "Best for everyday searches", isSelected: true),
    .init(title: "Sonar", subtitle: "Perplexity's fast model"),
    .init(title: "Claude 4.0 Sonnet", subtitle: "Anthropic's advanced model"),
    .init(title: "GPT-4.1", subtitle: "OpenAI's advanced model"),
    .init(title: "Gemini 2.5 Pro", subtitle: "Google's latest model"),
    .init(title: "Grok 3 Beta", subtitle: "xAI's latest model")
]
