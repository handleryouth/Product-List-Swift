//
//  ConfirmationCheckoutModal.swift
//  Product List
//
//  Created by Tony Gultom on 02/09/24.
//

import SwiftUI

struct ConfirmationCheckoutModal: View {
    
    @EnvironmentObject var router: RouterObserverableObject
    
    var onCancel: () -> Void
    var selectedMethod: String
    
    var body: some View {
        VStack (spacing: 10) {
            Text("Are you sure to use \(selectedMethod)?")
            
            HStack {
                Button(action: onCancel) {
                    Text("No")
                }
                
                Button(action: {router.navigate(to: .successCheckout)}) {
                    Text("Yes")
                    
                }
            }
        }.padding(20).background(.white).clipShape(.rect(cornerRadius: 10))
    }
}


