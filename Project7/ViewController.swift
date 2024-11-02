//
//  ViewController.swift
//  Project7
//
//  Created by Maksim Li on 29/10/2024.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    // 2-ое задание добавил UIsearchBar
    var filteredPetitions = [Petition]()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1-ое задание, тут я создал кнопку Credits
        let creditsButton = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(showCredits))
        navigationItem.rightBarButtonItem = creditsButton
        
        // 2-ое задание. Тут я указал настройки поиска
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "Search petitions"
        searchBar.sizeToFit()
        
        tableView.tableHeaderView = searchBar
        
        var urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
        showError()
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredPetitions.count : petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = isSearching ? filteredPetitions[indexPath.row] : petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = isSearching ? filteredPetitions[indexPath.row] : petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showCredits() {
        let ac = UIAlertController (title: "Data Source", message: "The data comes from Hacking with Swift's sample petitions.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
        } else {
            isSearching = true
            filteredPetitions = petitions.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }
}
