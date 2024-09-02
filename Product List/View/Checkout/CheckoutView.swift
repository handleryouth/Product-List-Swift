//
//  CheckoutView.swift
//  Product List
//
//  Created by Tony Gultom on 01/09/24.
//

import SwiftUI

var paymentMethodList: [PaymentMethodModel] = [
    PaymentMethodModel(paymentTitle: "Bank Transfer") {
        CheckoutBankTransferView()
    },
    PaymentMethodModel(paymentTitle: "Gopay") {
        CheckoutEWallet(eWalletType: .GOPAY)
    },
    PaymentMethodModel(paymentTitle: "OVO") {
        CheckoutEWallet(eWalletType: .OVO)
    },
    PaymentMethodModel(paymentTitle: "ShopeePay") {
        CheckoutEWallet(eWalletType: .SHOPEEPAY)
    }
]


struct CheckoutView: View {
    var body: some View {
        List {
            ForEach(paymentMethodList, id: \.paymentTitle) { method in
                NavigationLink(destination: method.viewDestination) {
                    Text(method.paymentTitle)
                }
            }
        }
            .navigationTitle("Method of Payment")
    }
}

#Preview {
    CheckoutView()
}
