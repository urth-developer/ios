//
//  SearchTableViewController.swift
//  URTH
//
//  Created by 장용범 on 06/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    var challenges: [Top10Challenge] = []
    var filteredChallenges: [Top10Challenge] = []
    
    var searchBarIsEmpty: Bool{
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    var isFiltering: Bool{
        return searchController.isActive && !searchBarIsEmpty
    }
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        definesPresentationContext = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //present(searchController, animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isFiltering{
            return filteredChallenges.count
        }
        return challenges.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        if isFiltering{
            if let image = filteredChallenges[indexPath.row].image{
                cell.mainImage.kf.setImage(with: URL(string: image), placeholder: UIImage())
            }else{
                cell.mainImage.image = #imageLiteral(resourceName: "imgChalCertified")
            }
            cell.titleLabel.text = filteredChallenges[indexPath.row].name
            if let creator = filteredChallenges[indexPath.row].creator{
                cell.nameLabel.text = filteredChallenges[indexPath.row].creator
            }else{
                cell.nameLabel.text = "URTH"
            }
            //cell.countLabel.text = "총 \(filteredChallenges[indexPath.row].count)회"
        }else{
            if let image = challenges[indexPath.row].image{
                cell.mainImage.kf.setImage(with: URL(string: image), placeholder: UIImage())
            }else{
                cell.mainImage.image = #imageLiteral(resourceName: "imgChalCertified")
            }
            cell.titleLabel.text = challenges[indexPath.row].name
            if let creator = challenges[indexPath.row].creator{
                cell.nameLabel.text = challenges[indexPath.row].creator
            }else{
                cell.nameLabel.text = "URTH"
            }
            //cell.countLabel.text = "총 \(challenges[indexPath.row].count)회"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFiltering{
            print(filteredChallenges[indexPath.row])
        }else{
            print(challenges[indexPath.row].name)
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


}

extension SearchTableViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ searchText: String){
        filteredChallenges = challenges.filter({ (challenge) -> Bool in
            let str = challenge.name
            return str.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
}
