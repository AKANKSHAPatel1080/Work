//
//  StatusTableViewCell.swift
//  AssignmentFive
//
//  Created by IOS Training 2 on 12/08/22.
//

import UIKit

class StatusTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var status: [UserData]?
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    static let identifier = "StatusTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "StatusTableViewCell", bundle: nil)
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()


        collectionView.register(StatusCollectionCell.nib(), forCellWithReuseIdentifier: StatusCollectionCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configure(with status:[UserData]) {
        self.status = status
        collectionView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageFloat = (scrollView.contentOffset.x / scrollView.frame.size.width)
        let pageInt = Int(round(pageFloat))
        
        switch pageInt {
        case 0:
            collectionView.scrollToItem(at: [0, 3], at: .left, animated: true)
        case status!.count - 1:
            collectionView.scrollToItem(at: [0, 1], at: .left, animated: true)
        default:
            break
        }
    
        collectionView.reloadData()
    }
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return status!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatusCollectionCell", for: indexPath) as! StatusCollectionCell
        //cell.config(with: FeedStauts[indexPath.row])
        cell.config(with: status![indexPath.row])
        return cell
    }
    
   
    
}

extension StatusTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 250)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let pageFloat = (scrollView.contentOffset.x / scrollView.frame.size.width)
            let pageInt = Int(round(pageFloat))
            
            switch pageInt {
            case 0:
                collectionView.scrollToItem(at: [0, 3], at: .left, animated: true)
            case status!.count - 1:
                collectionView.scrollToItem(at: [0, 1], at: .left, animated: true)
            default:
                break
            }
        return
        }
    
}

