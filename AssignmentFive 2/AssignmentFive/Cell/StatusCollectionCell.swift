//
//  StatusCollectionCell.swift
//  AssignmentFive
//
//  Created by IOS Training 2 on 12/08/22.
//

import UIKit

class StatusCollectionCell: UICollectionViewCell {
    
    
    
   // @IBOutlet weak var searchName: UISearchBar!
    
    @IBOutlet weak var statusImg: UIImageView!
    static let identifier = "StatusCollectionCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "StatusCollectionCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func config(with model: UserData) {
        self.statusImg.image = UIImage(named: model.imageName)
    }

}
