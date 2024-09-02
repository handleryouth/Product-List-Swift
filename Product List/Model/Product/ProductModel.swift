//
//  Product.swift
//  Product List
//
//  Created by Tony Gultom on 01/09/24.
//

import Foundation


class ProductImage: Decodable {
    var mobile: String
    var tablet: String
}

class Product: Decodable {
    var image: ProductImage
    var name: String
    var category: String
    var price: Double
    
    
    
    init(image: ProductImage, name: String, category: String, price: Double) {
        self.name  = name
        self.image = image
        self.category = category
        self.price = price
    }
    
    enum CodingKeys: CodingKey {
        case image
        case name
        case category
        case price
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.image = try container.decode(ProductImage.self, forKey: .image)
        self.name = try container.decode(String.self, forKey: .name)
        self.category = try container.decode(String.self, forKey: .category)
        self.price = try container.decode(Double.self, forKey: .price)
    }
}


class ProductSelected: Product {
    var quantity: Int
    
    init(quantity: Int, product: Product) {
        self.quantity = quantity
        super.init(image: product.image, name: product.name, category: product.category, price: product.price)
        
    }
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.quantity = try container.decode(Int.self, forKey: .quantity)
        try super.init(from: decoder)
    }
    
    
    private enum CodingKeys: String, CodingKey {
        case quantity
    }
    
}

