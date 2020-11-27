//
//  CharacterListController.swift
//  Homework_2
//
//  Created by Анастасия Гаранович on 27.11.20.
//

import UIKit

class CharacterListController: UITableViewController, CharacterListDelegate {
    
    var anime: Anime!
    
    func didPressButton(_ tag: Int) {
        let viewController = R.storyboard.main.characterInfoController()!
        viewController.character = anime.characters[tag]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CharacterListCell", bundle: nil), forCellReuseIdentifier: "CharacterListCell")
        navigationItem.title = "Character List"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return anime.characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterListCell", for: indexPath) as! CharacterListCell
        cell.cellDelegate = self
        cell.cellButton.tag = indexPath.row
        cell.characterLabel.text = anime.characters[indexPath.row].name
        cell.characterImage.image = anime.characters[indexPath.row].image
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
