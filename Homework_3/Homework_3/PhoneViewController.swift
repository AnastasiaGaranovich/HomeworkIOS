//
//  ViewController.swift
//  Homework_3
//
//  Created by Анастасия Гаранович on 7.12.20.
//

import UIKit

class PhoneViewController: UIViewController {
    
    @IBOutlet var phoneButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    
    @IBOutlet var zeroButton: UIButton!
    
    func checkEmptyString() {
        if (phoneNumber.text == "" || phoneNumber.text == nil) {
            phoneButton.isHidden = true
            deleteButton.isHidden = true
        }
        else {
            phoneButton.isHidden = false
            deleteButton.isHidden = false
        }
    }
    
    @IBOutlet var phoneNumber: UILabel!
    
    @IBAction func inputStar() {
        phoneNumber.text! += "*"
        checkEmptyString()
    }
    
    @IBAction func inputLattice() {
        phoneNumber.text! += "#"
        checkEmptyString()
    }
    
    @IBAction func inputNumber(button: UIButton) {
        phoneNumber.text! += String(button.tag)
        checkEmptyString()
    }
    @IBAction func deleteNumber() {
        phoneNumber.text?.removeLast()
        checkEmptyString()
    }
    
    @IBAction func makePhoneCall() {
        if let url = URL(string: "tel://\(phoneNumber.text!)"),
        UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        checkEmptyString()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(long))
            zeroButton.addGestureRecognizer(longGesture)
        checkEmptyString()
    }
    
    @objc func long() {
        phoneNumber.text! += "+"
        checkEmptyString()
        print("Long press")
    }
}
