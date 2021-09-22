//
//  DetailsViewController.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 22/09/2021.
//

import UIKit

//MARK: - DetailsViewProtocol
protocol DetailsViewProtocol: AnyObject {
    var presenter: DetailsPresenterProtocol? {get}
}

//MARK: - DetailsViewController
class DetailsViewController: UIViewController {

    @IBOutlet private weak var detailsImageView: UIImageView!
    
    var presenter: DetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = presenter?.title
       
    }
    
}

//MARK: - Confirming to DetailsViewProtocol
extension DetailsViewController: DetailsViewProtocol{
    
}
