//
//  CustomCell.swift
//  Homework_4
//
//  Created by Анастасия Гаранович on 14.12.20.
//

import UIKit

protocol CustomCellDelegate: class {
    func didPressButton(_ school: School)
}

class CustomCell: UITableViewCell {
    var cellDelegate: CustomCellDelegate?
    var school: School!
    
    @IBOutlet var studentName: UILabel!
    @IBOutlet var studentImage: UIImageView!
    @IBOutlet var cellButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        cellDelegate?.didPressButton(school)
    }
}
