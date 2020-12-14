//
//  ViewController.swift
//  Homework_4
//
//  Created by Анастасия Гаранович on 14.12.20.
//

import UIKit

class StudentViewController: UIViewController {
    
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var height: UILabel!
    @IBOutlet var photo: UIImageView!

    var student: Student!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameLabel.text = student.firstName
        lastNameLabel.text = student.lastName
        height.text = String(student.height)
        photo.image = student.image
        
    }


}

