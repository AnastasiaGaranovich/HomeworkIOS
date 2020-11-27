//
//  AnimeDiscriptionController.swift
//  Homework_2
//
//  Created by Анастасия Гаранович on 25.11.20.
//

import UIKit

class AnimeDiscriptionController: UIViewController {
    @IBOutlet var animeLabel: UILabel!
    @IBOutlet var animeDiscription: UILabel!
    @IBOutlet var animeLogo: UIImageView!
    
    @IBAction func pressButtonCharacters() {
        let viewController = R.storyboard.main.animeDiscriptionController()!
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
