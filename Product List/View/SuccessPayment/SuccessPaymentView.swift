//
//  SuccessPaymentView.swift
//  Product List
//
//  Created by Tony Gultom on 02/09/24.
//

import SwiftUI

struct SuccessPaymentView: View {
    @EnvironmentObject var router: RouterObserverableObject
    @EnvironmentObject var product: ProductObservableObject
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName:  "checkmark.seal.fill").resizable().frame(width: 150,height: 150)
            Text("Payment Success!").font(.title).fontWeight(.bold)
            Button(action: {
                product.deleteAll()
                router.navigateToRoot()
            }) {
                Text("Return to home")
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SuccessPaymentView()
}
