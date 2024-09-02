//
//  Product_ListApp.swift
//  Product List
//
//  Created by Tony Gultom on 31/08/24.
//

import SwiftUI
import SwiftData

@main
struct Product_ListApp: App {
    @StateObject var productObject = ProductObservableObject()
    
    @StateObject var routeObject = RouterObserverableObject()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $routeObject.navPath) {
                ContentView().navigationDestination(for: RouterObserverableObject.RouterDestination.self) {
                    destination in
                    switch destination {
                    case .home:
                        HomeView()
                    case .cart:
                        CartView()
                    case .checkout:
                        CheckoutView()
                    case .successCheckout:
                        SuccessPaymentView()
                    }
                }
            }
        }.environmentObject(productObject).environmentObject(routeObject)
    }
}
