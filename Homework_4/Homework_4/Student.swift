//
//  Student.swift
//  Homework_4
//
//  Created by Анастасия Гаранович on 14.12.20.
//

import UIKit

class Student {
    var firstName = ""
    var lastName = ""
    var image: UIImage!
    var height = 0
    
    init(firstName: String, lastName: String, image: UIImage, height: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.image = image
        self.height = height
    }
    
    func firstNameLastName(firstName: String, lastName: String) -> String {
        return firstName + lastName
    }
}
