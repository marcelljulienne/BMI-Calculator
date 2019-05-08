//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Marcell Julienne on 07/05/19.
//  Copyright © 2019 Marcell Julienne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var bmiScoreLabel: UILabel!
    @IBOutlet weak var bmiCategoryLabel: UILabel!
    
    @IBOutlet weak var weightTitleLabel: UILabel!
    @IBOutlet weak var heightTitleLabel: UILabel!
    @IBOutlet weak var bmiTitleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        firstState()
        
    }
    
    func firstState(){
    
        let minWeight = 20.0
        let maxWeight = 200.0
        let minHeight = 1.0
        let maxHeight = 2.5
        
        weightSlider.minimumValue = Float(minWeight)
        weightSlider.maximumValue = Float(maxWeight)
        
        heightSlider.minimumValue = Float(minHeight)
        heightSlider.maximumValue = Float(maxHeight)
        
        weightSlider.value = Float(minWeight)
        heightSlider.value = Float(minHeight)
        
        weightLabel.text = "\(minWeight) kg"
        heightLabel.text = "\(minHeight) m"
        updateBMILabel()
    }
    
    
    
    
    // fungsi untuk BMI Calculator
    
    @IBAction func weightValueChanged(_ sender: UISlider) {
        weightLabel.text = ("\(sender.value) kg")
        updateBMILabel()
    }
    
    @IBAction func heightValueChanged(_ sender: UISlider) {
        heightLabel.text = ("\(sender.value) m")
        updateBMILabel()
    }
    
    func updateBMILabel(){
        let weight = weightSlider.value
        let height = heightSlider.value
        let bmiValue = weight / (height * height)
        
        bmiScoreLabel.text = String(bmiValue)
        
        switch bmiValue {
        case 0..<18.5:
            bmiCategoryLabel.text = "Under Weight"
        case 18.5...24.99999:
            bmiCategoryLabel.text = "Perfect Weight"
        case 25...29.99999:
            bmiCategoryLabel.text = "Over Weight"
        case 30...999:
            bmiCategoryLabel.text = "Obese"
        default:
            bmiCategoryLabel.text = "Undefined"
            
        }
    }


// fungsi untuk Light and Dark Mode
    
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            print("light")
            lightUp()
        }
        else
        {
            print("dark")
            lightDown()
        }
    }
    
    var statusMode: UIStatusBarStyle = .default
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return statusMode
    }
    
    func lightUp(){
        view.backgroundColor = .white
        weightTitleLabel.textColor = .black
        heightTitleLabel.textColor = .black
        bmiTitleLabel.textColor = .black
        weightLabel.textColor = .black
        heightLabel.textColor = .black
        bmiCategoryLabel.textColor = .black
        bmiScoreLabel.textColor = .black
        
        statusMode = .default
        var preferredStatusBarStyle: UIStatusBarStyle{
            return statusMode
        }
        
        setNeedsStatusBarAppearanceUpdate()
        
    }
    
    func lightDown(){
        view.backgroundColor = .black
        weightTitleLabel.textColor = .white
        heightTitleLabel.textColor = .white
        bmiTitleLabel.textColor = .white
        weightLabel.textColor = .white
        heightLabel.textColor = .white
        bmiCategoryLabel.textColor = .white
        bmiScoreLabel.textColor = .white
        
        statusMode = .lightContent
        var preferredStatusBarStyle: UIStatusBarStyle{
            return statusMode
        }
        
        setNeedsStatusBarAppearanceUpdate()
    }


}
