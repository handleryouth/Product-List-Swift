//
//  CartView.swift
//  Product List
//
//  Created by Tony Gultom on 01/09/24.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var product: ProductObservableObject
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var confirmationModal = false
    
    @EnvironmentObject var router: RouterObserverableObject
    
    func getCartTotal() -> Int {
        let productTotal = product.productList.reduce(0){
            (result, product) -> Int in
            return result + product.quantity
        }
        return productTotal
    }
    
    
    func getTotalPrice() -> Double {
        let productTotal = product.productList.reduce(0){
            (result, product) -> Double in
            return result + (Double(product.quantity) * product.price)
        }
        return productTotal
    }
    
    
    
    var body: some View {
        VStack {
            Text("Your Cart (\(String(getCartTotal())))").font(.title).fontWeight(.bold)
            Spacer()
            List {
                ForEach(product.productList, id: \.name) {
                    product in CartList(product: product)
                }.onDelete(perform: { indexSet in
                    product.deleteProductByIndex(at: indexSet )
                })
                .listRowSeparator(.hidden)
            }
            
            
            
            if(product.productList.count != 0) {
                Text("Your total payment will be: $\(String(format: "%.2f", getTotalPrice()))").fontWeight(.semibold)
                
                Button(action: {
                    confirmationModal = true
                }) {
                    Text("Checkout")
                }.padding().tint(colorScheme == .dark ? .white: .orange).overlay {
                    RoundedRectangle(cornerRadius: 10.0).stroke(
                        colorScheme == .dark ? .white: .orange
                        , lineWidth: 2)
                }
            }
        }
        .modifier(Popup(isPresented: confirmationModal, alignment: .center, content:
                            {
            PriceModal(price: getTotalPrice() , onCancel: {
                confirmationModal = false
            })
        }, direction: .bottom
                       ))
        
        .navigationTitle("Cart").navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CartView()
}
