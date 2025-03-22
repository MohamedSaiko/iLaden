//
//  IconTextButton.swift
//  iLaden
//
//  Created by Mohamed Sayed on 22.03.25.
//

import SwiftUI

struct IconTextButton: View {
    private let icon: String
    private let text: String
    private let textSize: CGFloat
    private let minHeight: CGFloat
    private let maxWidth: CGFloat
    private let alignment: Alignment
    private let action: () -> Void
    
    @Environment(\.colorScheme) var colorScheme
    
    public init(icon: String = .isGoogleIcon(), text: String = "", textSize: CGFloat = 20, minHeight: CGFloat = 20, maxWidth: CGFloat = .infinity, alignment: Alignment = .center, action: @escaping () -> Void = {}) {
        self.icon = icon
        self.text = text
        self.textSize = textSize
        self.minHeight = minHeight
        self.maxWidth = maxWidth
        self.alignment = alignment
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack() {
                Image(icon)
                    .padding()
                
                Spacer()
                
                Text("Continue With Google")
                    .font(.isPrimary(withSize: textSize))
                    .padding()
                
                Spacer()
            }
        }
        .frame(maxWidth: maxWidth ,minHeight: minHeight, alignment: alignment)
        .background(Color.isSecondaryBackgroundColor())
        .foregroundColor(colorScheme == .dark ? .white : .black)
        .clipShape(Capsule())
        .padding()
    }
}

#Preview {
    IconTextButton()
}
