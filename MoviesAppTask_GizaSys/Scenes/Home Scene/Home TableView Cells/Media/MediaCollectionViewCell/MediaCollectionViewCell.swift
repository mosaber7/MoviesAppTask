//
//  MediaCollectionViewCell.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 20/09/2021.
//

import UIKit
import Kingfisher



class MediaCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var mediaImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var channelNameLabel: UILabel!
    @IBOutlet private weak var loader: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mediaImageView.layer.cornerRadius = 10
        showLoader()
    }
    func configureCell(with media: Media) {
        nameLabel.text = media.title
        channelNameLabel.text = media.channelTitle
        guard let urlString = media.coverAssetURL, let url = URL(string: urlString) else {
            return
        }
        mediaImageView.kf.setImage(with: url)
hideLoader()
    }
    
    private func showLoader(){
        loader.isHidden = false
        loader.startAnimating()
    }
    private func hideLoader(){
        loader.stopAnimating()
        loader.isHidden = true
        
    }
   
}

