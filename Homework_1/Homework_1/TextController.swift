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
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    @IBOutlet var colorButton: UIButton!
    
    var redColorSl: Float = 0.0
    var greenColorSl: Float = 0.0
    var blueColorSl: Float = 0.0
    
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
        
        let redColor:Float? = Float(redColorField.text ?? "")
        let greenColor:Float? = Float(greenColorField.text ?? "")
        let blueColor:Float? = Float(blueColorField.text ?? "")
    
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
        let selectedColorSl = UIColor(rgbColorCodeRed: redColorSl, green: greenColorSl, blue: blueColorSl, alpha: 1.0)
        transition(color: selectedColorSl)
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
    
    @IBAction func redSliderValueChanged(_ sender: Any) {
        redColorSl = redColorSlider.value * 255.0
        colorButton.backgroundColor = UIColor(rgbColorCodeRed: redColorSl, green: greenColorSl, blue: blueColorSl, alpha: 1.0)
    }
    
    @IBAction func greenSliderValueChanged(_ sender: Any) {
        greenColorSl = greenColorSlider.value * 255.0
        colorButton.backgroundColor = UIColor(rgbColorCodeRed: redColorSl, green: greenColorSl, blue: blueColorSl, alpha: 1.0)
    }
    
    @IBAction func blueSliderValueChanged(_ sender: Any) {
        blueColorSl = blueColorSlider.value * 255.0
        colorButton.backgroundColor = UIColor(rgbColorCodeRed: redColorSl, green: greenColorSl, blue: blueColorSl, alpha: 1.0)
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            redColorField.isHidden = false
            greenColorField.isHidden = false
            blueColorField.isHidden = false
            
            redColorSlider.isHidden = true
            greenColorSlider.isHidden = true
            blueColorSlider.isHidden = true
        case 1:
            redColorField.isHidden = true
            greenColorField.isHidden = true
            blueColorField.isHidden = true
            
            redColorSlider.isHidden = false
            greenColorSlider.isHidden = false
            blueColorSlider.isHidden = false
        default:
            break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        redColorSlider.isHidden = true
        greenColorSlider.isHidden = true
        blueColorSlider.isHidden = true
    }


}

