//
//  ViewController.swift
//  Controls Practice
//
//  Created by Kirill Dev on 27.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet var switches: [UISwitch]!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    
    var number: UInt8 = 128 {
        didSet{
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        rotateSwitches()
    }
    
    func rotateSwitches(){
        for selector in switches{
            selector.layer.transform = CATransform3DMakeRotation(-.pi / 2, 0, 0, 1)
        }
    }
    
    
    
    /// Updates number from the switches set
    func updateNumberFromSwitches(){
       var number = 0
        for selector in switches{
            number += selector.isOn ? selector.tag : 0
        }
        self.number = UInt8(number % 256)
        
    }
    
    /// Updates switches from the number
    func updateSwitches(){
        for selector in switches{
            selector.isOn = Int(number) & selector.tag != 0
        }
        
    }
    
    /// Updates all outlets of number
    func updateUI(){
        button.setTitle("\(number)", for: [])
        updateSwitches()
        slider.value = Float(number)
        textField.text = "\(number)"
    }

    @IBAction func buttonPressed() {
        number = UInt8((Int(number) + 1) % 256)
    }
    
    @IBAction func switchToggle(_ sender: UISwitch) {
        updateNumberFromSwitches()
    }
    
    @IBAction func sliderMoved() {
        number = UInt8(slider.value)
    }
    

    @IBAction func textFiedEdits() {
        number = UInt8(textField.text ?? "") ?? 128
    }
    
}

