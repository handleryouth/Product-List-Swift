//
//  LoadJson.swift
//  Product List
//
//  Created by Tony Gultom on 31/08/24.
//

import Foundation

func loadProduct() -> [Product]? {
    if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([Product].self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
