//
//  ChannelsCollectionViewCell.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 20/09/2021.
//

import UIKit

class ChannelsCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var channelImageView: UIImageView!
    @IBOutlet private weak var channelTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        channelImageView.layer.cornerRadius = 10
    }


}
