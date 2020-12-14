//
//  CustomCell.swift
//  Homework_4
//
//  Created by Анастасия Гаранович on 14.12.20.
//

import UIKit

protocol CustomCellDelegate: class {
    func didPressButton(_ student: Student)
}

class CustomCell: UITableViewCell {
    var cellDelegate: CustomCellDelegate?
    var student: Student!
    
    @IBOutlet var studentName: UILabel!
    @IBOutlet var studentImage: UIImageView!
    @IBOutlet var cellButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        cellDelegate?.didPressButton(student)
    }
}
