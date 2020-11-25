//
//  AnimeListCell.swift
//  Homework_2
//
//  Created by Анастасия Гаранович on 25.11.20.
//

import UIKit

protocol AnimeListDelegate: class {
    func didPressButton(_ tag: Int)
}

class AnimeListCell: UITableViewCell {
    var cellDelegate: AnimeListDelegate?
    @IBOutlet var animeLabel: UILabel!
    @IBOutlet var animeImage: UIImageView!
    @IBOutlet var cellButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        cellDelegate?.didPressButton(sender.tag)
    }
}
