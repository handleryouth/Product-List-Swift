//
//  RouterObserverableObject.swift
//  Product List
//
//  Created by Tony Gultom on 31/08/24.
//

import Foundation
import SwiftUI


final class RouterObserverableObject: ObservableObject {
    @Published var navPath  = NavigationPath()
    
    public enum RouterDestination: Codable, Hashable {
        case home
        case cart
        case checkout
        case successCheckout
    }
    
    func navigate(to destination: RouterDestination) {
          navPath.append(destination)
      }
      
      func navigateBack() {
          navPath.removeLast()
      }
      
      func navigateToRoot() {
          navPath.removeLast(navPath.count)
      }
}
