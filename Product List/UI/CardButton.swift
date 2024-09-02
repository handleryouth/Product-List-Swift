//
//  CardButton.swift
//  Product List
//
//  Created by Tony Gultom on 31/08/24.
//

import SwiftUI


struct RightImageLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center, spacing: 5) {
            configuration.title
            configuration.icon
        }
    }
}

struct CardButton: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var onButtonClick: () -> Void
    
    init(onButtonClick: @escaping () -> Void) {
        self.onButtonClick = onButtonClick
    }
    
    var body: some View {
        Button {
            onButtonClick()
        } label: {
            Label("Add to cart", systemImage: "cart.fill.badge.plus")
            .padding().tint(colorScheme == .dark ? .white: .orange)        }.labelStyle(RightImageLabelStyle()).background( colorScheme == .dark ? .black : .white ).clipShape(.rect(cornerRadius: .infinity)).overlay {
                RoundedRectangle(cornerRadius: .infinity)
                    .stroke(colorScheme == .dark ? .white: .orange , lineWidth: 2)
            }  }
}

#Preview {
    CardButton(
        onButtonClick: {
            print("Hello world")
        })
}
