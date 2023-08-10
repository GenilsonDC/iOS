//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Genilson do Carmo Silva on 07/08/23.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    
    var calculateLogic = CalculateLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func heightSliderCHANGE(_ sender: UISlider) {
        let heightValue = String(format: "%.2f", sender.value)
        heightLabel.text = "\(heightValue)m"
        
    }
    
    @IBAction func weightSliderCHANGE(_ sender: UISlider) {
        let weightValue = String(format: "%.1f", sender.value)
        weightLabel.text = "\(weightValue)kg"
    }
    
    @IBAction func calculateButtonPress(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculateLogic.bmiCalculationFormula(height: height, weight: weight)
       performSegue(withIdentifier: "goToResultView", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultView"{
            let destinationVC = segue.destination as! ResulteViewController
            destinationVC.bmiValue = calculateLogic.getBMIValue()
            destinationVC.advice = calculateLogic.getAdvice()
            destinationVC.color = calculateLogic.getColors()
        }
        
    
    }
    
}

