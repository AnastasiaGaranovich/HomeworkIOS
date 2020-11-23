//
//  ViewController.swift
//  Homework_1
//
//  Created by Анастасия Гаранович on 23.11.20.
//

import UIKit

enum ColorNumInputError : Error {
    case wrongColorRange(String)
    case wrongInput(String)
}

class TextController: UIViewController {
    
    @IBOutlet var redColorField: UITextField!
    @IBOutlet var greenColorField: UITextField!
    @IBOutlet var blueColorField: UITextField!
    
    private func transition() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ColorViewController") as! ColorViewController
        self.view.window?.rootViewController = viewController
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func showPressed(_ sender: UIButton) {
        
        let redColor:Int? = Int(redColorField.text ?? "")
        let greenColor:Int? = Int(greenColorField.text ?? "")
        let blueColor:Int? = Int(blueColorField.text ?? "")
        
        func checkColorRange() throws {
            guard let red = redColor else {
                throw ColorNumInputError.wrongInput("Wrong Input of Red Color")
            }
            guard let green = greenColor else {
                throw ColorNumInputError.wrongInput("Wrong Input of Green Color")
            }
            guard let blue = blueColor else {
                throw ColorNumInputError.wrongInput("Wrong Input of Blue Color")
            }
            if(red < 0 || red > 255) {
                throw ColorNumInputError.wrongColorRange("Wrong Red Color Range")
            }
            if(green < 0 || green > 255) {
                throw ColorNumInputError.wrongColorRange("Wrong Green Color Range")
            }
            if(blue < 0 || blue > 255) {
                throw ColorNumInputError.wrongColorRange("Wrong Blue Color Range")
            }
        }
        
        do {
            try checkColorRange()
            transition()
        } catch ColorNumInputError.wrongColorRange(let message) {
            print(message)
        } catch ColorNumInputError.wrongInput(let message){
            print(message)
        }
        catch {
            print("Unknown error")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

