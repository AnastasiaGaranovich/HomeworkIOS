//
//  AddStudentController.swift
//  Homework_4
//
//  Created by Анастасия Гаранович on 16.12.20.
//

import UIKit

class AddStudentController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    
    @IBOutlet var addPhotoButton: UIButton!
    @IBOutlet var photo: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func imageButtonPressed() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
                    print("Button capture")

                    imagePicker.delegate = self
                    imagePicker.sourceType = .savedPhotosAlbum
                    imagePicker.allowsEditing = false

                    present(imagePicker, animated: true, completion: nil)
                }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
            self.dismiss(animated: true, completion: { () -> Void in

            })

            photo.image = image
        }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let height = heightTextField.text ?? ""
        
        if(photo.image == nil) {
            School.students.append(Student(firstName: firstName, lastName: lastName, image: R.image.studentlog()!, height: Int(height)!))
        }
        else {
            School.students.append(Student(firstName: firstName, lastName: lastName, image: photo.image!, height: Int(height)!))
        }
        
        print("Student data saved")
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
