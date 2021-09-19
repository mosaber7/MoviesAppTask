//
//  ViewController.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 19/09/2021.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.retrieveCatgories(modelType: CategoryContainer.self) { (resonse) in
            print(resonse)
        }
    }


}

