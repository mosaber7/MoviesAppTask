//
//  ChannelDetailsPresenter.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 22/09/2021.
//

import Foundation
//MARK:- DetailsPresenter

class CahnnelDetailsPresenter{
    weak var view: DetailsViewProtocol?
    var media : LatestMedia?
    init(view: DetailsViewProtocol, media: LatestMedia?) {
        self.view = view
        self.media = media
        print(media?.title)
    }
  
}
//MARK:- DetailsPresenter confirming to DetailsPresenterProtocol
extension CahnnelDetailsPresenter: DetailsPresenterProtocol{
    func intiateView() {
        guard let urlString = media?.coverAsset?.url, let url = URL(string: urlString) else {
            return
        }
        view?.setImage(with: url)
    }

}
