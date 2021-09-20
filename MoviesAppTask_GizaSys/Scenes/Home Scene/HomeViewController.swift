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
    @IBOutlet weak var homeTableView: UITableView!
    var presenter: HomePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        presenter = HomePresenter(view: self)
        presenter?.intiateView()
       
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter?.numberOfRowsInSection ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = homeTableView.dequeue() as MediaTableViewCell
            return cell
        }
        if indexPath.row == 5 {
            let cell = homeTableView.dequeue() as CategoriesTableViewCell
            cell.fillStackViews(categories: presenter?.categories ?? [])
            return cell
            
        }
        let cell = homeTableView.dequeue() as ChannelsTableViewCell
        
        return cell
        
    } 
    
}

