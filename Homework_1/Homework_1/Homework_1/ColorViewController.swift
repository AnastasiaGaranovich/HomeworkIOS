//
//  ColorViewController.swift
//  Homework_1
//
//  Created by Анастасия Гаранович on 23.11.20.
//

import UIKit

class ColorViewController: UIViewController {
    @IBAction func returnPressed(_ sender: UIButton) {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TextController") as! TextController
            self.view.window?.rootViewController = viewController
            self.view.window?.makeKeyAndVisible()
            }
}
