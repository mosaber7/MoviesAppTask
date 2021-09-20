//
//  HomeRouter.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 19/09/2021.
//

import Foundation
import UIKit

protocol HomeRouterProtocol {
 //   func createHomeModel()-> UIViewController
}

protocol Route {
    var destination: UIViewController{get}
    var style: NavigationStyle{get}
}

enum NavigationStyle {
    case push
    case modal
}


class HomeRouter:NSObject{
 private weak var viewController: HomeViewProtocol?
    convenience init(view:HomeViewProtocol) {
        self.init()
        viewController = view
    }
}
extension HomeRouter: HomeRouterProtocol{
    
}

enum HomeNavigationRouter: Route {
    
    case Details
    
    var destination: UIViewController{
        switch self {
        case .Details:
           return UIViewController()
        }
        
    }
    
    var style: NavigationStyle{
        switch self {
        case .Details:
            return.push
        }
    }

}
