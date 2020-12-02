//
//  CharacterListController.swift
//  Homework_2
//
//  Created by Анастасия Гаранович on 27.11.20.
//

import UIKit

extension CharacterListController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    filterContentForSearchText(searchBar.text!)
  }
}

class CharacterListController: UITableViewController, CharacterListCellDelegate {
    
    var anime: Anime!
    let searchController = UISearchController(searchResultsController: nil)
    var filteredCharacter = [Character]()
    
    func setUpSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Character"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func didPressButton(_ character: Character) {
        let viewController = R.storyboard.main.characterInfoController()!
        viewController.character = character
        self.navigationController?.pushViewController(viewController, animated: true)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CharacterListCell", bundle: nil), forCellReuseIdentifier: "CharacterListCell")
        navigationItem.title = "Character List"
        setUpSearchController()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredCharacter.count
        }
        return anime.characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterListCell", for: indexPath) as! CharacterListCell
        cell.cellDelegate = self
        let character: Character
        if isFiltering {
            character = filteredCharacter[indexPath.row]
        } else {
            character = anime.characters[indexPath.row]
        }
        cell.characterLabel.text = character.name
        cell.characterImage.image = character.image
        cell.character = character
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
        
        filteredCharacter = anime.characters.filter { (character: Character) -> Bool in
            return character.name.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
}
