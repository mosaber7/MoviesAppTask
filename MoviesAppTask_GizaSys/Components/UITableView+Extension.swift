//
//  UITableView+Extension.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 20/09/2021.
//

import Foundation
import UIKit

extension UITableView{
    
    func dequeue<Cell: UITableViewCell>() -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            preconditionFailure("unexpecteted cell identifiee")
        }
        
        return cell
    }
    func registerNib<Cell: UITableViewCell>(cell: Cell.Type){
        let identifier = String(describing: Cell.self)
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        
    }
    
}
protocol NavigationRoute {
    func navigate(to route: Route)
}

extension UIViewController: NavigationRoute{
    func navigate(to route: Route) {
        switch route.style {
        
        case .push:
            self.navigationController?.pushViewController(route.destination, animated: true)
        case .modal:
            
            self.present(route.destination, animated: true, completion: nil)
        }
    }
    
    
}



extension UICollectionView{
    func dequeue<Cell: UICollectionViewCell>(for index: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: index) as? Cell else {
            preconditionFailure("unexpecteted cell identifiee")
        }
        
        return cell
    }
    
    func registerNib<Cell: UICollectionViewCell>(cell: Cell.Type){
        let identifier = String(describing: Cell.self)
        self.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
        
    }
}
