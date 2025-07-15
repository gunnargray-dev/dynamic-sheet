// MARK: - Imports
import SwiftUI

// MARK: - Tray Configuration
/// Configuration for the custom tray sheet, including detents, corner radius, and padding
struct TrayConfig {
    var detents: Set<PresentationDetent>
    var cornerRadius: CGFloat = 30
    var isInteractiveDismissDisabled: Bool = false
    /// Horizontal padding for the tray content
    var horizontalPadding: CGFloat = 15
    /// Bottom padding for the tray content
    var bottomPadding: CGFloat = 15
    
    /// Initialize with a single detent
    init(maxDetent: PresentationDetent) {
        self.detents = [maxDetent]
    }
    
    /// Initialize with a set of detents
    init(detents: Set<PresentationDetent>) {
        self.detents = detents
    }
}

// MARK: - System Tray View Extension
/// Extension to present a custom tray sheet with advanced configuration
extension View {
    @ViewBuilder
    func systemTrayView<Content: View>(
        _ show: Binding<Bool>,
        config: TrayConfig = .init(detents: [.height(600)]),
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self
            .sheet(isPresented: show) {
                content()
                    .background(.background)
                    .clipShape(.rect(cornerRadius: config.cornerRadius))
                    .padding(.horizontal, config.horizontalPadding)
                    .padding(.bottom, config.bottomPadding)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    /// Presentation Configurations
                    .presentationDetents(config.detents)
                    .presentationCornerRadius(0)
                    .presentationBackground(.clear)
                    .presentationDragIndicator(.hidden)
                    .interactiveDismissDisabled(config.isInteractiveDismissDisabled)
                    .background(RemoveSheetShadow())
            }
    }
}

// MARK: - Remove Sheet Shadow Helper
/// Removes the default shadow from the sheet for a cleaner look
fileprivate struct RemoveSheetShadow: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        DispatchQueue.main.async {
            if let shadowView = view.dropShadowView {
                shadowView.layer.shadowColor = UIColor.clear.cgColor
            }
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // No update needed
    }
}

// MARK: - UIView Drop Shadow Extension
/// Extension to help find the drop shadow view in the UIKit hierarchy
extension UIView {
    var dropShadowView: UIView? {
        if let superview, String(describing: type(of: superview)) == "UIDropShadowView" {
            return superview
        }
        
        return superview?.dropShadowView
    }
}
