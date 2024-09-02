//
//  CheckoutBankTransferView.swift
//  Product List
//
//  Created by Tony Gultom on 01/09/24.
//

import SwiftUI

let collectionOfBanks: [String] = ["BNI", "BRI", "BCA", "BSI", "JAGO", "Mandiri", "Danamon"]


struct CheckoutBankTransferView: View {
    
    @State private var selectedBank = ""
    @State private var showConfirmationModal = false
    var body: some View {
        VStack {
            
            List {
                ForEach(collectionOfBanks, id: \.self) {bank in
                    VStack {
                        Button(action: {
                            showConfirmationModal = true
                            selectedBank = bank
                        }) {
                            Text(bank).frame(maxWidth: .infinity, alignment: .leading).background(.white)
                        }.buttonStyle(.plain)
                    }
                    
                }
            }.modifier(
                Popup(isPresented: showConfirmationModal, alignment: .center, content: {
                    ConfirmationCheckoutModal(
                        onCancel: {
                            selectedBank = ""
                            showConfirmationModal = false
                        }, selectedMethod: selectedBank)
                }, direction: .bottom)
            )
        }.navigationTitle("Choose Bank")
        
    }
}

#Preview {
    CheckoutBankTransferView()
}
