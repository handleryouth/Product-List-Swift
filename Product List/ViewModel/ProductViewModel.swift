//
//  ProductViewModel.swift
//  Product List
//
//  Created by Tony Gultom on 01/09/24.
//

import Foundation

class ProductObservableObject: ObservableObject {
    @Published var productList = [ProductSelected]()
    
    func addProductList(product: Product) {
        let searchProductIndex = productList.firstIndex(where: {
            $0.name == product.name
        })
        if(searchProductIndex == nil) {
            let productInstance = ProductSelected(quantity: 1, product: product)
            productList.append(productInstance)
        } else {
            let foundProduct = productList[searchProductIndex!]
            productList[searchProductIndex!] = ProductSelected(quantity: foundProduct.quantity + 1 , product: product)
        }
        
    }
    
    func deleteProduct(product: Product) {
        productList.removeAll {$0.name == product.name}
    }
    
    func deleteProductByIndex(at productIndex: IndexSet) {
        productList.remove(atOffsets: productIndex)
    }
    
    func deleteAll() {
        productList.removeAll()
    }
    
}
