//
//  Character.swift
//  Homework_2
//
//  Created by Анастасия Гаранович on 25.11.20.
//

import UIKit

class Character {
    var name = ""
    var image: UIImage!
    var discription = ""
    
    init(name: String, discription: String, image: UIImage) {
        self.name = name
        self.discription = discription
        self.image = image
    }
}
