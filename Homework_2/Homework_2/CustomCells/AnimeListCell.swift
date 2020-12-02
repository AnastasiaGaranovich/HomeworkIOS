//
//  AnimeListCell.swift
//  Homework_2
//
//  Created by Анастасия Гаранович on 25.11.20.
//

import UIKit

protocol AnimeListCellDelegate: class {
    func didPressButton(_ anime: Anime)
}

class AnimeListCell: UITableViewCell {
    var cellDelegate: AnimeListCellDelegate?
    var anime: Anime!
    @IBOutlet var animeLabel: UILabel!
    @IBOutlet var animeImage: UIImageView!
    @IBOutlet var cellButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        cellDelegate?.didPressButton(anime)
    }
}
