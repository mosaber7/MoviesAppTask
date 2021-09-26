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
    func intiateView()
}

//MARK:- DetailsPresenter
class MediaDetailsPresenter{
    weak var view: DetailsViewProtocol?
    var media : Media?
    init(view: DetailsViewProtocol, media: Media?) {
        self.view = view
        self.media = media
    }
    
    
}
//MARK:- DetailsPresenter confirming to DetailsPresenterProtocol
extension MediaDetailsPresenter: DetailsPresenterProtocol{

    func intiateView() {
        guard let urlString = media?.coverAssetURL, let url = URL(string: urlString) else {
            return
        }
        view?.setImage(with: url)
    }
    
    
}
