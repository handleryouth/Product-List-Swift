//
//  Popup.swift
//  Product List
//
//  Created by Tony Gultom on 01/09/24.
//

import SwiftUI

struct Popup<T: View>: ViewModifier {
    
    enum Direction {
         case top, bottom

         func offset(popupFrame: CGRect) -> CGFloat {
             switch self {
             case .top:
                 let aboveScreenEdge = -popupFrame.maxY
                 return aboveScreenEdge
             case .bottom:
                 let belowScreenEdge = UIScreen.main.bounds.height - popupFrame.minY
                 return belowScreenEdge
             }
         }
     }
    
    let popup: T
    let isPresented: Bool
    let alignment: Alignment
    let direction: Direction

    // 1.
    init(isPresented: Bool, alignment: Alignment,@ViewBuilder content: () -> T, direction: Direction) {
        self.isPresented = isPresented
        self.alignment = alignment
        self.direction = direction
        popup = content()
    }

    // 2.
    /*
     In the body() method we add the popup as an overlay to the parent view.
     */
    func body(content: Content) -> some View {
        /*
         current content in the modifier attached to
         */
        content
            .overlay(popupContent())
    }

    // 3.
    /*
     ViewBuilder: special attribute in SwiftUI that allows you to create and return multiple views from a closure, enabling you to build complex views in a declarative and compositional manner.
     */
    @ViewBuilder 
    private func popupContent() -> some View {
        GeometryReader { geometry in
            if isPresented {
                popup
                /*
                 The transition(_:) modifier specifies how a view appears and disappears.
                 */
                    .transition(.offset(x: 0, y: direction.offset(popupFrame: geometry.frame(in: .global))))
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: alignment)
            }
        }    /*
              The value parameter is the state or condition that triggers the animation.
              */
                 .animation(.spring(), value: isPresented)
    }
}
