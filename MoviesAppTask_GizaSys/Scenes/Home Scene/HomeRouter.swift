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
    
    case MediaDetails(Media)
    case ChannelDetails(LatestMedia)
    var destination: UIViewController{
        switch self {
        case .MediaDetails(let media):
            guard let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "\(DetailsViewController.self)") as? DetailsViewController else{
                fatalError("Couldn't find VC with the identifier \(DetailsViewController.self)")
            }
            let detailsPresenter = MediaDetailsPresenter(view: detailsVC, media: media)
            
            detailsVC.presenter = detailsPresenter
           return detailsVC
            
            
        case .ChannelDetails(let media):
            guard let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "\(DetailsViewController.self)") as? DetailsViewController else{
                fatalError("Couldn't find VC with the identifier \(DetailsViewController.self)")
            }
            let detailsPresenter = CahnnelDetailsPresenter(view: detailsVC, media: media)
            
            detailsVC.presenter = detailsPresenter
           return detailsVC
        }
        
    }
    
    var style: NavigationStyle{
        switch self {
        case .MediaDetails:
            return .modal
            
        case .ChannelDetails:
            return .modal
        }
    }

}
