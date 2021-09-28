//
//  ViewController.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 19/09/2021.
//

import UIKit

//MARK: - Home view protocl
protocol HomeViewProtocol: AnyObject, NavigationRoute {
    var presenter: HomeViewPresenterProtocol? {get}
    func reloadData()
}

//MARK:- Home View
class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    var presenter: HomeViewPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        presenter = HomePresenter(view: self)
        
        DispatchQueue.main.async {
            self.presenter?.intiateView()
        }
        
    }
    
    private func registerCells(){
        homeTableView.registerNib(cell: ChannelsTableViewCell.self)
        homeTableView.registerNib(cell: CategoriesTableViewCell.self)
        homeTableView.registerNib(cell: MediaTableViewCell.self)
    }
}

extension HomeViewController: HomeViewProtocol{
    func reloadData() {
        homeTableView.reloadData()
        
    }
    
}
//MARK: - Table View setup
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter?.numberOfRowsInSection ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        //media Cell
        case 0:
            let cell = homeTableView.dequeue() as MediaTableViewCell
            self.presenter?.configureMediaCell(cell: cell)
            return cell
         
        // last Table view cell
        case ((presenter?.numberOfRowsInSection ?? 0) - 1) :
            let cell = homeTableView.dequeue() as CategoriesTableViewCell
            self.presenter?.configureCategoryCell(cell: cell)
            return cell
            
       //channels cell
        default:
            let cell = homeTableView.dequeue() as ChannelsTableViewCell
            self.presenter?.configureChannelCell(cell: cell, index: indexPath.row - 1)
            return cell
        }
        
    } 
    
}

