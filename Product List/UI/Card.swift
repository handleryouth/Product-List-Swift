//
//  Card.swift
//  Product List
//
//  Created by Tony Gultom on 31/08/24.
//

import SwiftUI

struct Card: View {
    
    @EnvironmentObject var productList: ProductObservableObject
    
    
    
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            ZStack(alignment: .bottom) {
                Image(product.image.mobile).resizable().aspectRatio(contentMode: .fit).clipShape(.rect(cornerRadius: 20))
                
                CardButton(onButtonClick: {
                    productList.addProductList(product: product)
                    print("image clicked", product.price)
                }).offset(y: 20)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.category).fontWeight(.light)
                Text(product.name).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("$\(String( format: "%.2f", product.price))")
            }
      
        
           
        }
        
    }
}


