//
//  ViewController.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 19/09/2021.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? {get}
    func reloadData()
}
class HomeViewController: UIViewController {
var presenter: HomePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = HomePresenter(view: self)
        presenter?.intiateView()
       
    }
}

extension HomeViewController: HomeViewProtocol{
    func reloadData() {
    }
    
}

