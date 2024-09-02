//
//  ProductView.swift
//  Product List
//
//  Created by Tony Gultom on 31/08/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var productList = [Product]()
    
    
    @EnvironmentObject var productObject: ProductObservableObject
    
    @EnvironmentObject var routerObject: RouterObserverableObject
    
    
    func loadProductData () {
        let data = loadProduct()
        if(data != nil) {
            productList = data!
        }
    }
    
    
    var body: some View {
        VStack {
            List(productList, id: \.name){
                product in Card(product: product)
                    .listRowSeparator(.hidden)
                    .listStyle(PlainListStyle())
            }.buttonStyle(BorderlessButtonStyle())
        }.onAppear {
            loadProductData()
        }.background(.white)
            .navigationTitle("Desserts").toolbar() {
                ToolbarItem {
                    Button(action: {
                        routerObject.navigate(to: .cart)
                    }, label: {
                        Label(String(productObject.productList.count), systemImage: "cart.fill.badge.plus").labelStyle(RightImageLabelStyle())
                    })
                    
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Delete All") {
                        productObject.deleteAll()
                    }.disabled(productObject.productList.count == 0).tint(.red)
                }
            }
    }
}


#Preview {
    HomeView()
}
