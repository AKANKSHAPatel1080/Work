//
//  FeedCell.swift
//  AssignmentFive
//
//  Created by IOS Training 2 on 11/08/22.
//

import UIKit

class FeedCell: UITableViewCell {
   
   var delegate: deleteButtonWasTappedIn?

    
    @IBOutlet weak var feedLabel: UILabel!
    @IBOutlet weak var cross: UIButton!
    var feedId: Int?
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    
    
    static let identifier = "FeedCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "FeedCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }
    
//    @objc func didTapDelete() {
//            didDelete()
//        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteUser(_ sender: UIButton) {
        //delegate?.didDeleteOnTap()
        self.delegate?.deleteTapped(at: feedId)
        
        
    }
    @IBAction func likeBtn(_ sender: UIButton) {
    }
    @IBAction func commentBtn(_ sender: UIButton) {
    }
    @IBAction func shareBtn(_ sender: UIButton) {
    }
    
    @IBAction func moreBtn(_ sender: UIButton) {
        self.delegate?.moreTapped()
    }
    
    func configure(with model:UserData){
        self.NameLabel.text = model.userName
        self.feedLabel.text = model.feed
        self.UserImage.image = UIImage(named: model.imageName)
        
        feedId = model.feedId
    }
    
   
}


protocol deleteButtonWasTappedIn{
    func deleteTapped(at index:Int?)
    func moreTapped()
}
