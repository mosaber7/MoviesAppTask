//
//  ChannelsTableViewCell.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 20/09/2021.
//

import UIKit

class ChannelsTableViewCell: UITableViewCell {

    @IBOutlet weak var eposidesCollectionView: UICollectionView!
    
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
        return cell
        
    }
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: eposidesCollectionView.frame.width * 0.4, height: eposidesCollectionView.frame.height)
    }
    
    
}
