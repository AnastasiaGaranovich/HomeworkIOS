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
    
    private func transition(color: UIColor?) {
        let controller = R.storyboard.main.colorViewController()!
        controller.backColor = color
        self.view.window?.rootViewController = controller
        self.view.window?.makeKeyAndVisible()
    }
    
    private func AlertView(message: String) {
        let dialogMessage = UIAlertController(title: "Attention", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
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
            let selectedColor = UIColor(rgbColorCodeRed: red, green: green, blue: blue, alpha: 1.0)
            transition(color: selectedColor)
        }
        
        do {
            try checkColorRange()
        } catch ColorNumInputError.wrongColorRange(let message) {
            AlertView(message: message)
        } catch ColorNumInputError.wrongInput(let message){
            AlertView(message: message)
        }
        catch {
            print("Unknown error")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

