//
//  CharacterListCell.swift
//  Homework_2
//
//  Created by Анастасия Гаранович on 27.11.20.
//

import UIKit

protocol CharacterListCellDelegate: class {
    func didPressButton(_ character: Character)
}

class CharacterListCell: UITableViewCell {
    var cellDelegate: CharacterListCellDelegate?
    var character: Character!
    @IBOutlet var characterLabel: UILabel!
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var cellButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        cellDelegate?.didPressButton(character)
    }
}
