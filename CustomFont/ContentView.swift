//
//  ContentView.swift
//  CustomFont
//
//  Created by Michelle Grover on 10/25/23.
//

import SwiftUI

class BoldTextViewModel: ObservableObject {
    @Published var isBoldTextEnabled: Bool = UIAccessibility.isBoldTextEnabled
}

struct ContentView: View {
    @StateObject var viewModel = BoldTextViewModel()

    var body: some View {
        VStack(spacing: 20) {
            // Adapt font based on Bold Text setting
            Text("This text adapts to Bold Text setting")
                .font(Font.custom(viewModel.isBoldTextEnabled ? "Helvetica-Bold" : "Helvetica", size: 20))
                .adaptiveFont()
        }
        .padding()
        .onReceive(NotificationCenter.default.publisher(for: UIAccessibility.boldTextStatusDidChangeNotification)) { _ in
            viewModel.isBoldTextEnabled = UIAccessibility.isBoldTextEnabled
        }
    }
}

extension View {
    func adaptiveFont() -> some View {
        self.modifier(AdaptiveFont())
    }
}

struct AdaptiveFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory

    func body(content: Content) -> some View {
        content
            .font(.system(size: UIFontMetrics.default.scaledValue(for: 20))) // 20 is the base size
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
