//
//  PriceModal.swift
//  Product List
//
//  Created by Tony Gultom on 01/09/24.
//

import SwiftUI

struct PriceModal: View {
    var price: Double
    
    @EnvironmentObject var router: RouterObserverableObject
    @Environment(\.colorScheme) var colorScheme
    
    var onCancel: () -> Void
    
    var body: some View {
        VStack {
            Text("Your payment will be $\(String( format: "%.2f", price))")
            Text("Are you sure?")
            
            HStack(spacing: 10) {
                Button(action: onCancel) {
                    Text("Check again")
                }.padding()
                
                Button(action: {router.navigate(to: .checkout)}) {
                    Text("Okay")
                }.padding()
                
            }
        }.padding(30).background(colorScheme == .dark ? .black: .white).clipShape(.rect(cornerRadius: 10)).overlay {
            if(colorScheme == .dark) {
                RoundedRectangle.rect(cornerRadius: 10).stroke(.white, lineWidth: 2)
            }
        }
        
    }
}
