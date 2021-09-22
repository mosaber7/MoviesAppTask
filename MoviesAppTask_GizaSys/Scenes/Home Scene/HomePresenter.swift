//
//  HomePresenter.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 19/09/2021.
//

import Foundation

protocol  HomePresenterProtocol {
    var view: HomeViewProtocol?{get}
    var numberOfRowsInSection: Int{get}
    var categories: [Category]{get}

    
    func categoryContainerFetchedWithError(error: String)
    func categoryContainerFetchedSuccessfully(categories: [Category])
    
    func mediaContainerFetchedSuccessfully(media: [Media])
    func mediaContainerFetchedWithError(error: String)
    
    func channelContainerFetchedSuccessfully(channels: [Channel])
    func channelContainerFetchedWithError(error: String)
    
    func configureMediaCell(cell: MediaTVCellProtocol)
    
    func intiateView()
    
}

class HomePresenter{
    weak var view: HomeViewProtocol?
    private var interactor: HomeInteractorProtocol?
    private var router: HomeRouterProtocol?
    var categories:  [Category] = [Category]()
     var media = [Media]()
    private var channels = [Channel]()
    
    var numberOfRowsInSection: Int{
        return 6
    }
    
    init(view: HomeViewProtocol) {
        self.view = view
        self.interactor = HomeInteractor(presenter: self)
        self.router = HomeRouter(view: self.view!)
    }
}

extension HomePresenter: HomePresenterProtocol {
    
    func intiateView() {
//        self.interactor?.getCategories()
//        self.interactor?.getMedia()
//        self.view?.reloadData()
//       self.interactor?.getChannels()
    }
    
    func categoryContainerFetchedWithError(error: String) {
        print("Categories fetching error: \(error)")
    }
    func categoryContainerFetchedSuccessfully(categories: [Category]){
        self.categories = categories
        print("catogries fetched successfully")
        print("Categories: \(categories.count)")
    }
    
    func mediaContainerFetchedSuccessfully(media: [Media]) {
        self.media = media
        self.view?.reloadData()
        print("media fetched successfully")

    }
    
    func mediaContainerFetchedWithError(error: String) {
        print("Media fetching error: \(error)")
    }
    
    func channelContainerFetchedSuccessfully(channels: [Channel]) {
        self.channels = channels
        self.view?.reloadData()
        print("channels fetched successfully")

    }
    
    func channelContainerFetchedWithError(error: String) {
        print("channels fetching error: \(error)")

    }
    func configureMediaCell(cell: MediaTVCellProtocol){
        cell.configureCollectionCells(with: media)
        cell.reloadData()
    }
    
    
}
