//
//  HomePresenter.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 19/09/2021.
//

import Foundation

//MARK: - HomeView Presenter Protocol
protocol  HomeViewPresenterProtocol {
    var view: HomeViewProtocol?{get}
    var numberOfRowsInSection: Int{get}
    
    
    func categoryContainerFetchedWithError(error: String)
    func categoryContainerFetchedSuccessfully(categories: [Category])
    
    func mediaContainerFetchedSuccessfully(media: [Media])
    func mediaContainerFetchedWithError(error: String)
    
    func channelContainerFetchedSuccessfully(channels: [Channel])
    func channelContainerFetchedWithError(error: String)
    
    func configureMediaCell(cell: MediaTVCellProtocol)
    func configureChannelCell(cell: ChannelTVCellProtocol, index: Int)
    func configureCategoryCell(cell: CategoriesTableViewCellProtocol)
    
    
    func intiateView()
    
}

protocol MediaViewPresenterProtocol {
    func configureCell(cell: MediaCollectionViewCellProtocol, for index: Int)
    func mediaCVClicked(at index: Int)
}

protocol ChannelViewPresenterProtocol {
    func configureCell(cell: ChannelCVCellProtocol, tvIndex : Int, cvIndex: Int)
    func channelCVClicked(at TVindex:Int, and CVIndex: Int)
    
    
    
    func getChannelTitle(for index: Int)-> String
    func getEposideLabel(for index: Int)-> String
    func getCoverAssetUrl(for index: Int)-> URL?
    
}

//MARK: - Home Presenter
class HomePresenter{
    weak var view: HomeViewProtocol?
    private var interactor: HomeInteractorProtocol?
    private var router: HomeRouterProtocol?
    private var categories:  [Category] = [Category]()
    private var media = [Media]()
    private var channels = [Channel](){
        didSet{
            self.view?.reloadData()
        }
    }
    
    var numberOfRowsInSection: Int{
        guard channels.count + 2 < 6 else {
            return 6
        }
        print(channels.count + 2)
        return channels.count + 2
    }
    
    init(view: HomeViewProtocol) {
        self.view = view
        self.interactor = HomeInteractor(presenter: self)
        self.router = HomeRouter(view: self.view!)
    }
}

//MARK: - Home Presenter setup
extension HomePresenter: HomeViewPresenterProtocol {
    
    func intiateView() {
        self.interactor?.getCategories()
        self.interactor?.getMedia()
        self.interactor?.getChannels()
        
        
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
        cell.configureCollectionCells(with: self)
        cell.reloadData()
        
    }
    func configureChannelCell(cell: ChannelTVCellProtocol, index: Int){
        cell.configureTableViewCell(with: self, tvRow: index)
        cell.reloadData()
        
        
    }
    func configureCategoryCell(cell: CategoriesTableViewCellProtocol) {
        cell.fillStackViews(categories: self.categories)
        
        
    }
    
}

extension HomePresenter: MediaViewPresenterProtocol{
    func mediaCVClicked(at index: Int) {
        let media = self.media[index]
        let detailsView = HomeNavigationRouter.MediaDetails(media)
        self.view?.navigate(to: detailsView)
    }
    
    
    func configureCell(cell: MediaCollectionViewCellProtocol, for index: Int) {
        guard index < media.count else{
            return
        }
        cell.configureCell(with: self.media[index])
        
    }
    
}

extension HomePresenter: ChannelViewPresenterProtocol{
    func getEposideLabel(for index: Int) -> String {
        "\(channels[index].mediaCount ?? 0) episodes"
    }
    
    func getCoverAssetUrl(for index: Int) -> URL? {
        guard let urlString = channels[index].coverAsset?.url, let url = URL(string: urlString) else{
            return nil
        }
        return url
    }
    
    func getChannelTitle(for index: Int) -> String {
        self.channels[index].title ?? "??"
    }
    
    
    func configureCell(cell: ChannelCVCellProtocol, tvIndex : Int, cvIndex: Int) {
        guard let currentLatestMedia = self.channels[tvIndex].latestMedia?[cvIndex] else {
            return
        }
        cell.configureCVCell(with: currentLatestMedia)
    }
    
    func channelCVClicked(at TVindex:Int, and CVIndex: Int){
        guard let latestMedia = self.channels[TVindex].latestMedia?[CVIndex] else{
            return
        }
        let detailsRoute = HomeNavigationRouter.ChannelDetails(latestMedia)
        self.view?.navigate(to: detailsRoute)
        
    }
    
}

