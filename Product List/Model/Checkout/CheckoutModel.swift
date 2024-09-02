//
//  CheckoutModel.swift
//  Product List
//
//  Created by Tony Gultom on 01/09/24.
//

import Foundation
import SwiftUI

struct PaymentMethodModel {
    var paymentTitle: String
    var viewDestination: AnyView
    
    
    /*
     The initializer in PaymentMethodModel has a generic type to allow flexibility in passing different types of views to the destinationView property. 
     */
    init<Content: View>(paymentTitle: String, @ViewBuilder viewDestination: () -> Content) {
        self.paymentTitle = paymentTitle
        /*
         AnyView is a type-erased wrapper that allows you to store different view types in a single array.
         */
        self.viewDestination = AnyView(viewDestination())
    }
}
