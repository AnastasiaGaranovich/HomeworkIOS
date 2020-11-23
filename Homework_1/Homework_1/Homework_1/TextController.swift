//
//  ViewController.swift
//  Homework_1
//
//  Created by Анастасия Гаранович on 23.11.20.
//

import UIKit

class TextController: UIViewController {
    
    @IBOutlet var redColorField: UITextField!
    @IBOutlet var greenColorField: UITextField!
    @IBOutlet var blueColorField: UITextField!
    
    
    @IBAction func ShowPressed(_ sender: UIButton) {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ColorViewController") as! ColorViewController
            self.view.window?.rootViewController = viewController
            self.view.window?.makeKeyAndVisible()
            }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

