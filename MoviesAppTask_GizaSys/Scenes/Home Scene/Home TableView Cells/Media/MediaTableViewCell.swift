//
//  MediaTableViewCell.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 20/09/2021.
//

import UIKit


//MARK: - Media table view cell protocol

protocol MediaTVCellProtocol {
    func configureCollectionCells(with presenter: MediaViewPresenterProtocol)
    func reloadData()
}


//MARK: - Media table view cell
class MediaTableViewCell: UITableViewCell {
    @IBOutlet weak var mediaCollectionView: UICollectionView!
    private var presenter: MediaViewPresenterProtocol?
    
  
    
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

//MARK: - MediaTableViewCell conforming to collection View
extension MediaTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.mediaCollectionView.dequeue(for: indexPath) as MediaCollectionViewCell
        self.presenter?.configureCell(cell: cell, for: indexPath.row)
        return cell
    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: mediaCollectionView.frame.width * 0.45, height: mediaCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter?.mediaCVClicked(at: indexPath.row)
    }
    
}

//MARK: - MediaTableViewCell conforming to MediaTVCellProtocol

extension MediaTableViewCell: MediaTVCellProtocol{
    func reloadData() {
        self.mediaCollectionView.reloadData()
    }
    
    func configureCollectionCells(with presenter: MediaViewPresenterProtocol) {
        self.presenter = presenter
        
    }
    
}
