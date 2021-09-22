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
    var title: String{get}
    func intiateView()
}

//MARK:- DetailsPresenter
class DetailsPresenter{
    weak var view: DetailsViewProtocol?
    var channel : Media?
    init(view: DetailsViewProtocol, channel: Media?) {
        self.view = view
        self.channel = channel
    }
    var title: String{
        return channel?.title ?? "??"
    }
    
}
//MARK:- DetailsPresenter confirming to DetailsPresenterProtocol
extension DetailsPresenter: DetailsPresenterProtocol{
    func intiateView() {
        guard let urlString = channel?.coverAssetURL, let url = URL(string: urlString) else {
            return
        }
        view?.setImage(with: url)
    }
    
    
}
