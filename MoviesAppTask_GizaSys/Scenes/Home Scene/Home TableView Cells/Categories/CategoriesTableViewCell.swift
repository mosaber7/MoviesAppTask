//
//  CategoriesTableViewCell.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 20/09/2021.
//

import UIKit

protocol CategoriesTableViewCellProtocol {
    func fillStackViews(categories: [Category])
    
}

class CategoriesTableViewCell: UITableViewCell {
    @IBOutlet weak var leadingStackView: UIStackView!
    @IBOutlet weak var trailingStackView: UIStackView!
    
    var allButtons = [UIButton]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
extension CategoriesTableViewCell: CategoriesTableViewCellProtocol{
    
    func fillStackViews(categories: [Category]) {
     var categoriesTemp = categories
        if allButtons.count > 0 {return}
        while categoriesTemp.count > 0{
            let button = UIButton()
            let category = categoriesTemp.removeLast()
            button.frame.size = CGSize(width: 240, height: 70)
            button.setTitle(category.name ?? "", for: .normal)
            button.backgroundColor = .gray
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = button.frame.height / 2
            allButtons.append(button)
            
        }
        for (index,button) in allButtons.enumerated(){
            if index % 2 == 0{
                leadingStackView.addArrangedSubview(button)
            }else{
                trailingStackView.addArrangedSubview(button)
            }
        }
    }
    
    
    
}


