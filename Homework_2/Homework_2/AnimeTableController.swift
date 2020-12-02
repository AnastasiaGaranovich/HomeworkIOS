//
//  ViewController.swift
//  Homework_2
//
//  Created by Анастасия Гаранович on 25.11.20.
//

import UIKit

extension AnimeTableController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    filterContentForSearchText(searchBar.text!)
  }
}


class AnimeTableController: UITableViewController, AnimeListCellDelegate {
    
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredAnime = [Anime]()
    
    func setUpSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Anime"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func didPressButton(_ anime: Anime) {
        let viewController = R.storyboard.main.animeDiscriptionController()!
        viewController.anime = anime
        self.navigationController?.pushViewController(viewController, animated: true)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "AnimeListCell", bundle: nil), forCellReuseIdentifier: "AnimeListCell")
        setUpSearchController()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredAnime.count
        }
        return AppData.animeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimeListCell", for: indexPath) as! AnimeListCell
        cell.cellDelegate = self
        let anime: Anime
        if isFiltering {
            anime = filteredAnime[indexPath.row]
        } else {
            anime = AppData.animeList[indexPath.row]
        }
        cell.animeLabel.text = anime.name
        cell.animeImage.image = anime.image
        cell.anime = anime
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    func filterContentForSearchText(_ searchText: String) {
        
        filteredAnime = AppData.animeList.filter { (anime: Anime) -> Bool in
            return anime.name.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
}

