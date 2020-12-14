//
//  School.swift
//  Homework_4
//
//  Created by Анастасия Гаранович on 14.12.20.
//

import UIKit

class School {
    static var students = [Student]()
    
   static func createSchool() {
        students.append(Student(firstName: "James", lastName: "Thron", image: R.image.studentlog()!, height: 175))
        students.append(Student(firstName: "Lolita", lastName: "Brands", image: R.image.studentlog()!, height: 168))
        students.append(Student(firstName: "Bredly", lastName: "Throwh", image: R.image.studentlog()!, height: 182))
    }
    
}

