//
//  CharacterInfoController.swift
//  Homework_2
//
//  Created by Анастасия Гаранович on 27.11.20.
//

import UIKit

class CharacterInfoController: UIViewController {
    
    @IBOutlet var characterLabel: UILabel!
    @IBOutlet var characterDiscription: UITextView!
    @IBOutlet var characterImage: UIImageView!
    
    var character: Characters!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterLabel.text = character.name
        characterImage.image = character.image
        characterDiscription.text = character.discription
        navigationItem.title = "Character Info"
    }
}
