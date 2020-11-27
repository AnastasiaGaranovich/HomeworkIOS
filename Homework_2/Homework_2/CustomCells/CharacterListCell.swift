//
//  CharacterListCell.swift
//  Homework_2
//
//  Created by Анастасия Гаранович on 27.11.20.
//

import UIKit

protocol CharacterListDelegate: class {
    func didPressButton(_ tag: Int)
}

class CharacterListCell: UITableViewCell {
    var cellDelegate: CharacterListDelegate?
    @IBOutlet var characterLabel: UILabel!
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var cellButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        cellDelegate?.didPressButton(sender.tag)
    }
}
