//
//  ViewController.swift
//  AssignmentFive
//
//  Created by IOS Training 2 on 11/08/22.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var table: UITableView!
    
    var Searching = false
    
    var feed: [UserData]?
    var filteredData: [UserData]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        fetchData()
        filteredData = feed
        table.register(FeedCell.nib(), forCellReuseIdentifier: FeedCell.identifier)
        table.register(StatusTableViewCell.nib(), forCellReuseIdentifier: StatusTableViewCell.identifier)
    }

    func fetchData(){
        guard let fileLocation = Bundle.main.url(forResource: "Feed", withExtension: "json")
        else{
            return
        }
        do {
            let data = try Data(contentsOf: fileLocation)
            let recievedData = try JSONDecoder().decode(StatusResults.self, from: data)
            self.feed = recievedData.feedData
            DispatchQueue.main.async{
                self.table.reloadData()
            }

        }
        catch{
            print("Error while decoding")
        }
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData!.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       if indexPath.row == 0 {
            let cell = table.dequeueReusableCell(withIdentifier: "StatusTableViewCell", for: indexPath) as! StatusTableViewCell
           cell.configure(with: filteredData!)
           
            print("\(indexPath)")
           
            return cell
        }
        
       else  {
        let cell = table.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedCell
           cell.configure(with: filteredData![indexPath.row-1])
           cell.delegate = self
           

       return cell
    }
             
    }
    
            
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 120+140+view.frame.size.width
        return 500
    }

}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filteredData = feed
            
        } else {
            let post = feed?.filter({$0.userName.lowercased().contains(searchText.lowercased())})
        filteredData = post
        }
    table.reloadData()
   }
}

extension ViewController: deleteButtonWasTappedIn{
   
    func moreTapped() {
        let alert = UIAlertController(title: "ooops!", message: "Unable to login", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        self.present(alert, animated: true)
    }
    
    func deleteTapped(at index: Int?) {
        let alert = UIAlertController(title: nil, message: "Are you sure you'd like to delete this user", preferredStyle: .alert)
       let yesAction = UIAlertAction(title: "Yes", style: .default) { _ in
        self.feed?.removeAll(where: ({$0.feedId == index}))
        self.filteredData?.removeAll(where: ({$0.feedId == index}))
        self.table.reloadData()
       }
           alert.addAction(yesAction)
           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
           self.present(alert, animated: true, completion: nil)

    }
}

