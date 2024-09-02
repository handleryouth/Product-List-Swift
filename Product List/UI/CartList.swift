//
//  CartList.swift
//  Product List
//
//  Created by Tony Gultom on 01/09/24.
//

import SwiftUI

struct CartList: View {
    
    
    var product: ProductSelected
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(product.name).fontWeight(.bold)
                HStack (spacing: 10){
                    Text("\(String(product.quantity))x").multilineTextAlignment(.leading)
                    Text("@ $\(String(format: "%.2f", product.price))").multilineTextAlignment(.leading)
                    Text("$\(String(format: "%.2f", product.price * Double(product.quantity)))").fontWeight(.bold).multilineTextAlignment(.leading)
                }
            }
        }
        
        
    }
}

