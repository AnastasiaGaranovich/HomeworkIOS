//
//  SchoolTableViewController.swift
//  Homework_4
//
//  Created by Анастасия Гаранович on 14.12.20.
//

import UIKit

class SchoolTableViewController: UITableViewController, CustomCellDelegate {
    
    func didPressButton(_ student: Student) {
        let viewController = R.storyboard.main.studentViewController()!
        viewController.student = student
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return School.students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let students = School.students[indexPath.row]
        cell.cellDelegate = self
        cell.studentName.text = students.firstNameLastName(firstName: students.firstName, lastName: students.lastName)
        cell.studentImage.image = students.image
        cell.student = students
        return cell
    }
    
    
}
