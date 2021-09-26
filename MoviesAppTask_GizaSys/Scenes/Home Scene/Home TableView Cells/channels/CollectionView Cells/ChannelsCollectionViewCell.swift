//
//  ChannelsCollectionViewCell.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 20/09/2021.
//

import UIKit

protocol ChannelCVCellProtocol {
    func configureCVCell(with media: LatestMedia)
}

class ChannelsCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var channelImageView: UIImageView!
    @IBOutlet private weak var channelTitleLabel: UILabel!
    @IBOutlet private weak var loader: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        channelImageView.layer.cornerRadius = 10
    }
    
    func configCell(with media: LatestMedia){

        channelTitleLabel.text = media.title
        guard let urlString = media.coverAsset?.url, let url = URL(string: urlString) else {
            return
        }
        channelImageView.kf.setImage(with: url)
        hideLoader()
    }
    
    private func hideLoader(){
        loader.stopAnimating()
        loader.isHidden = true
        
    }
}

extension ChannelsCollectionViewCell: ChannelCVCellProtocol{
    func configureCVCell(with media: LatestMedia) {
        channelTitleLabel.text = media.title
        guard let urlString = media.coverAsset?.url, let url = URL(string: urlString) else {
            return
        }
        channelImageView.kf.setImage(with: url)
        hideLoader()
    }
    
    
}
