//
//  HomeInteractor.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 19/09/2021.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol?{get}
    func getCategories()
    func getMedia()
    func getChannels()
}

class HomeInteractor{
    var presenter: HomePresenterProtocol?
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
    
}

extension HomeInteractor: HomeInteractorProtocol{
    //MARK: - Categories
    func getCategories(){
        NetworkManager.retrieveDataWithCaching(modelType: CategoryContainer.self, requestType: MoviesRequestFactory.categories) { [weak self] (categoryContainer) in
            guard let container = categoryContainer as? CategoryContainer, let categories = container.categories else{
                self?.presenter?.categoryContainerFetchedWithError(error: "Could not cast the response")
                return
            }
            
            self?.presenter?.categoryContainerFetchedSuccessfully(categories: categories)
        }
    }
    
    //MARK: - Media
    func getMedia() {
        NetworkManager.retrieveDataWithCaching(modelType: MediaContainer.self, requestType: MoviesRequestFactory.media) { [weak self](mediaContainer) in
            guard let container = mediaContainer as? MediaContainer, let media = container.media else{
                self?.presenter?.mediaContainerFetchedWithError(error: "Could not cast the response")
                return
            }
            self?.presenter?.mediaContainerFetchedSuccessfully(media: media)
        }
    }
    
    //MARK: - Channels
//    func getChannels() {
//        NetworkManager.retrieveDataWithCaching(modelType: ChannelContainer.self, requestType: MoviesRequestFactory.channels) { [weak self](channelsContainer) in
//            guard let container = channelsContainer as? ChannelContainer, let channels = container.channels else{
//                print(channelsContainer)
//                self?.presenter?.channelContainerFetchedWithError(error: "Could not cast the response")
//                return
//            }
//            self?.presenter?.channelContainerFetchedSuccessfully(channels: channels)
//        }
//    }
    
    
    func getChannels() {
        NetworkManager.retrieveData { (response) in
            switch response{
            
            case .success(let container):
                guard let channels = container.data?.channels else {
                    return
                }
                print(channels)
                self.presenter?.channelContainerFetchedSuccessfully(channels: channels)
            case .failure(let error):
                self.presenter?.channelContainerFetchedWithError(error: error.localizedDescription)
            }
        }
    }
}
