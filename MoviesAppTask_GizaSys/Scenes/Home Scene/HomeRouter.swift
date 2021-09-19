//
//  HomeRouter.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 19/09/2021.
//

import Foundation
import UIKit

protocol HomeInteractorProtocol {
    func createHomeModel()-> UIViewController
}

protocol Route {
    var destination: UIViewController{get}
    var style: NavigationStyle{get}
}

enum NavigationStyle {
    case push
    case modal
}


class HomeRouter: HomeInteractorProtocol{
    weak var vc: UIViewController?
    func createHomeModel() -> UIViewController {
        guard  let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "\(HomeViewController.self)") as? HomeViewController else{
            
            fatalError("Couldn't find VC with the identifies \(HomeViewController.self)")
        }
    return view
    }
    
    
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
