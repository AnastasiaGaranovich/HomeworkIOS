//
//  Anime.swift
//  Homework_2
//
//  Created by Анастасия Гаранович on 25.11.20.
//

import UIKit

class Anime {
    var discription = ""
    var name = ""
    var image: UIImage!
    var characters = [Character]()
    init(name: String, discription: String, image: UIImage, characters: [Character]) {
        self.name = name
        self.discription = discription
        self.image = image
        self.characters = characters
    }
}
