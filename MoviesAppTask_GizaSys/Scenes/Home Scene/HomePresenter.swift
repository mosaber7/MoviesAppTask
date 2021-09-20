//
//  HomePresenter.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 19/09/2021.
//

import Foundation

protocol  HomePresenterProtocol {
    var view: HomeViewProtocol?{get}

    
    func categoryContainerFetchedWithError(error: String)
    func categoryContainerFetchedSuccessfully(categories: [Category])
    
    func mediaContainerFetchedSuccessfully(media: [Media])
    func mediaContainerFetchedWithError(error: String)
    
    func channelContainerFetchedSuccessfully(channels: [Channel])
    func channelContainerFetchedWithError(error: String)
    
    func intiateView()
    
}

class HomePresenter{
    weak var view: HomeViewProtocol?
    private var interactor: HomeInteractorProtocol?
    private var router: HomeRouterProtocol?
    private var categories = [Category]()
    private var media = [Media]()
    private var channels = [Channel]()
    
    init(view: HomeViewProtocol) {
        self.view = view
        self.interactor = HomeInteractor(presenter: self)
        self.router = HomeRouter(view: self.view!)
    }
}

extension HomePresenter: HomePresenterProtocol {
    
    func intiateView() {
        self.interactor?.getCategories()
        self.interactor?.getMedia()
        
    //   self.interactor?.getChannels()
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
        print("media fetched successfully")
        print("Media: \(media.count)")
    }
    
    func mediaContainerFetchedWithError(error: String) {
        print("Media fetching error: \(error)")
    }
    
    func channelContainerFetchedSuccessfully(channels: [Channel]) {
        self.channels = channels
        print(channels.first)
        print("channels fetched successfully")
        print(channels.count)

    }
    
    func channelContainerFetchedWithError(error: String) {
        print("channels fetching error: \(error)")

    }
    
}
