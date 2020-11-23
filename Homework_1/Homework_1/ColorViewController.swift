//
//  ColorViewController.swift
//  Homework_1
//
//  Created by Анастасия Гаранович on 23.11.20.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBAction func returnPressed(_ sender: UIButton) {
        let controller = R.storyboard.main.textController()!
        self.view.window?.rootViewController = controller
        self.view.window?.makeKeyAndVisible()
    }
    
    var backColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backColor
    }
}
