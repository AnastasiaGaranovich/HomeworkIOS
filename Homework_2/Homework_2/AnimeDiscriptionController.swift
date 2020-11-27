//
//  AnimeDiscriptionController.swift
//  Homework_2
//
//  Created by Анастасия Гаранович on 25.11.20.
//

import UIKit

class AnimeDiscriptionController: UIViewController {
    @IBOutlet var animeLabel: UILabel!
    @IBOutlet var animeDiscription: UITextView!
    @IBOutlet var animeLogo: UIImageView!
    
    @IBAction func pressButtonCharacters() {
        let viewController = R.storyboard.main.characterListController()!
        viewController.anime = anime
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    var anime: Anime!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animeLabel.text = anime.name
        animeLogo.image = anime.image
        animeDiscription.text = anime.discription
        navigationItem.title = "Discription"
    }
    
}
