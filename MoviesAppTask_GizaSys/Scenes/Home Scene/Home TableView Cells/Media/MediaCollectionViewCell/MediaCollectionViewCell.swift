//
//  MediaCollectionViewCell.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 20/09/2021.
//

import UIKit

class MediaCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var mediaImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mediaImageView.layer.cornerRadius = 10
    }
    

}
