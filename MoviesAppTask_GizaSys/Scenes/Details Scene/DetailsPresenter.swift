//
//  DetailsPresenter.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 22/09/2021.
//

import Foundation


//MARK:- DetailsPresenterProtocol
protocol DetailsPresenterProtocol {
    var view: DetailsViewProtocol? {get}
}

//MARK:- DetailsPresenter
class DetailsPresenter{
    weak var view: DetailsViewProtocol?
    
    init(view: DetailsViewProtocol) {
        self.view = view
    }
}
//MARK:- DetailsPresenter confirming to DetailsPresenterProtocol
extension DetailsPresenter: DetailsPresenterProtocol{
    
}
