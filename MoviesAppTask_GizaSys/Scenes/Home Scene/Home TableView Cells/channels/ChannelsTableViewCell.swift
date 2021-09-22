//
//  ChannelsTableViewCell.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 20/09/2021.
//

import UIKit
import Kingfisher

protocol ChannelTVCellProtocol {
    func configureTableViewCell(channel: Channel)
}

class ChannelsTableViewCell: UITableViewCell {

    @IBOutlet private weak var sectionImageImageView: UIImageView!
    @IBOutlet private weak var sectionNameLabel: UILabel!
    @IBOutlet private weak var eposidesCollectionView: UICollectionView!
    private var channel: Channel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        registerCells()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func registerCells(){
        eposidesCollectionView.registerNib(cell: ChannelsCollectionViewCell.self)
    }
    
}

extension ChannelsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.eposidesCollectionView.dequeue(for: indexPath) as ChannelsCollectionViewCell
        guard let channel  = channel, let media = channel.latestMedia else {
            return cell
        }
        cell.configCell(with: media[indexPath.row] )
        return cell
        
    }
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: eposidesCollectionView.frame.width * 0.4, height: eposidesCollectionView.frame.height)
    }
    
    
}

extension ChannelsTableViewCell: ChannelTVCellProtocol{
    func configureTableViewCell(channel: Channel) {
        self.channel = channel
        sectionNameLabel.text = channel.title
        guard let urlString = channel.iconAssetURL, let url = URL(string: urlString) else{
            return
        }
        sectionImageImageView.kf.setImage(with: url)
    }
    
    
}
