//
//  ChannelsTableViewCell.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 20/09/2021.
//

import UIKit
import Kingfisher


//MARK: - Channel Table View Cell Protocol
protocol ChannelTVCellProtocol {
    func configureTableViewCell(with presenter: ChannelViewPresenterProtocol, tvRow: Int)
    func reloadData()
}

class ChannelsTableViewCell: UITableViewCell {

    @IBOutlet private weak var sectionImageImageView: UIImageView!
    @IBOutlet private weak var sectionNameLabel: UILabel!
    @IBOutlet private weak var eposidesCollectionView: UICollectionView!
    @IBOutlet weak var channelImageLoader: UIActivityIndicatorView!
    
    @IBOutlet private weak var eposidesLabel: UILabel!
    
    private var presenter: ChannelViewPresenterProtocol?
    private var tableViewCurrentRow: Int?
    
    // for navigation to details screen
    var onDidSelectItem: ((IndexPath) -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        sectionImageImageView.layer.cornerRadius = sectionImageImageView.frame.height / 2
        registerCells()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func registerCells(){
        eposidesCollectionView.registerNib(cell: ChannelsCollectionViewCell.self)
    }
    private func showLoader(){
        channelImageLoader.isHidden = false
        channelImageLoader.startAnimating()
    }
    private func hideLoader(){
        channelImageLoader.isHidden = true
        channelImageLoader.stopAnimating()
        
    }
    
    private func configureCell(sectionNameLabel: String, eposidesLabel: String, url: URL?) {
        showLoader()
        self.sectionNameLabel.text = sectionNameLabel
        self.eposidesLabel.text = eposidesLabel
        guard let url = url else{
            return
        }
        sectionImageImageView.kf.setImage(with: url)
        hideLoader()
    }
    
}

// MARK:- Collection View setup

extension ChannelsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.eposidesCollectionView.dequeue(for: indexPath) as ChannelsCollectionViewCell
        self.presenter?.configureCell(cell: cell, tvIndex: tableViewCurrentRow ?? 0, cvIndex: indexPath.row)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let tableViewCurrentRow = self.tableViewCurrentRow else{
            return
        }
        self.presenter?.channelCVClicked(at: tableViewCurrentRow, and: indexPath.row)
    }
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: eposidesCollectionView.frame.width * 0.4, height: eposidesCollectionView.frame.height)
    }
    
    
}

//MARK: - ChannelsTableViewCell confiming to ChannelTVCellProtocol
extension ChannelsTableViewCell: ChannelTVCellProtocol{
    func reloadData() {
        eposidesCollectionView.reloadData()
    }
    
    func configureTableViewCell(with presenter: ChannelViewPresenterProtocol, tvRow: Int) {
        self.presenter = presenter
        self.tableViewCurrentRow = tvRow
        configureCell(sectionNameLabel: presenter.getChannelTitle(for: tvRow), eposidesLabel: presenter.getEposideLabel(for: tvRow), url: presenter.getCoverAssetUrl(for: tvRow))
    }
  
}
