//
//  MediaTableViewCell.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 20/09/2021.
//

import UIKit

protocol MediaTVCellProtocol {
    func configureCollectionCells(with media: [Media])
    func reloadData()
}

class MediaTableViewCell: UITableViewCell {

    @IBOutlet weak var mediaCollectionView: UICollectionView!
    private var media = [Media]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
registerCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func registerCell(){
        mediaCollectionView.registerNib(cell: MediaCollectionViewCell.self)
    }
    
    
}

extension MediaTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.mediaCollectionView.dequeue(for: indexPath) as MediaCollectionViewCell
        guard indexPath.row < media.count else {
            return cell
        }
        let currentMedia = media[indexPath.row]
        cell.configureCell(with: currentMedia)
        return cell
    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: mediaCollectionView.frame.width * 0.45, height: mediaCollectionView.frame.height)
    }
    
}

extension MediaTableViewCell: MediaTVCellProtocol{
    func reloadData() {
        self.mediaCollectionView.reloadData()
    }
    
    func configureCollectionCells(with media: [Media]) {
        self.media = media

    }

}
