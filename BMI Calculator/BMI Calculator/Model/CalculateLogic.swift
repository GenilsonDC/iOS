//
//  CalculateLogic.swift
//  BMI Calculator
//
//  Created by Genilson do Carmo Silva on 09/08/23.
//

import UIKit

struct CalculateLogic{
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiCalcFormated = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiCalcFormated
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice!"
    }
    func getColors() -> UIColor {
        return bmi?.color ?? UIColor.black
    }
    
    mutating func bmiCalculationFormula(height: Float, weight: Float){
        let bmiCalculation = weight/(powf(height, 2))
        
        if bmiCalculation < 18.5{
            bmi = BMI(value: bmiCalculation, advice: "🍲 Eat more calories.\n you are underweight!", color: UIColor(red: 1, green: 0.651, blue: 0.1667, alpha: 1))
        }else if bmiCalculation < 24.9{
            bmi = BMI(value: bmiCalculation, advice: "✨ Congratulations, keep on.\n You are at the ideal weight!", color: UIColor(red: 0.4627, green: 0.8392, blue: 1.0, alpha: 1))
        }
        else{
            bmi = BMI(value: bmiCalculation, advice: "🍎 Eat less calories.\n you are overweight!", color: UIColor.systemPink)
        }
        
    }
    
}
