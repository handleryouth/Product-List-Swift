//
//  CheckoutEWallet.swift
//  Product List
//
//  Created by Tony Gultom on 02/09/24.
//

import SwiftUI

enum EWalletType: String {
    case OVO = "OVO"
    case GOPAY = "Gopay"
    case SHOPEEPAY = "ShopeePay"
}


struct CheckoutEWallet: View {
    var eWalletType: EWalletType
    
    @EnvironmentObject var router: RouterObserverableObject
    
    func redirectoToSuccess() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            // Code to be executed after a 3-second delay
            router.navigate(to: .successCheckout)
        }
    }
    
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
        }.navigationBarBackButtonHidden(true)
            .onAppear {
                redirectoToSuccess()
            }
    }
}

#Preview {
    CheckoutEWallet(eWalletType: .OVO)
}
