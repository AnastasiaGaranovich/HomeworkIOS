//
//  ViewController.swift
//  Homework_2
//
//  Created by Анастасия Гаранович on 25.11.20.
//

import UIKit

class AnimeTableController: UITableViewController, AnimeListDelegate {
    
    func didPressButton(_ tag: Int) {
        let viewController = R.storyboard.main.animeDiscriptionController()!
        viewController.anime = AppData.animeList[tag]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "AnimeListCell", bundle: nil), forCellReuseIdentifier: "AnimeListCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.animeList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimeListCell", for: indexPath) as! AnimeListCell
        cell.cellDelegate = self
        cell.cellButton.tag = indexPath.row
        cell.animeLabel.text = AppData.animeList[indexPath.row].name
        cell.animeImage.image = AppData.animeList[indexPath.row].image
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

