//
//  DetailsViewController.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 22/09/2021.
//

import UIKit
import Kingfisher

//MARK: - DetailsViewProtocol
protocol DetailsViewProtocol: AnyObject {
    var presenter: DetailsPresenterProtocol? {get}
    func setImage(with url: URL)
}

//MARK: - DetailsViewController
class DetailsViewController: UIViewController {

    @IBOutlet private weak var detailsImageView: UIImageView!
    
    var presenter: DetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.intiateView()
       
    }
}

//MARK: - Confirming to DetailsViewProtocol
extension DetailsViewController: DetailsViewProtocol{
    func setImage(with url: URL) {
        
        detailsImageView.kf.setImage(with: url)
    }
    
}
