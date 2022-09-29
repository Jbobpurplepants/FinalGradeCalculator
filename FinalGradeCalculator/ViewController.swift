//
//  ViewController.swift
//  FinalGradeCalculator
//
//  Created by Phipps, Jacob - Student on 9/13/22.
//

import UIKit

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

@IBDesignable extension UITextField {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
        var numOneString = ""
        var numTwoString = ""
        var numThreeString = ""
        var numOneDouble = 0.0
        var numTwoDouble = 0.0
        var numThreeDouble = 0.0
        var numSolutionOne = 0.0
        var numSolutionTwo = 0.0
        var numSolutionThree = 0.0
        var currentWorth = 0.0
        var currentGradePercentage = 0.0
        var neededScore = 0.0
        var finalneededScore = 0.0
        var finalneededRounded = 0.0
        var finalneededString = ""
        var equationFactorOne = 0.0
        var equationFactorTwo = 0.0

    
    @IBOutlet weak var currentGrade: UITextField!
    
    @IBOutlet weak var desiredGrade: UITextField!
    
    @IBOutlet weak var examGrade: UITextField!
    
    @IBOutlet weak var neededGrade: UILabel!
    
    @IBAction func actionCalculate(_ sender: Any) {
        
        numOneString = currentGrade.text ?? "0"
        currentGrade.resignFirstResponder()
        numTwoString = desiredGrade.text ?? "0"
        desiredGrade.resignFirstResponder()
        numThreeString = examGrade.text ?? "0"
        examGrade.resignFirstResponder()
        numOneDouble = Double(numOneString) ?? 0.0
        numTwoDouble = Double(numTwoString) ?? 0.0
        numThreeDouble = Double(numThreeString) ?? 0.0
        numSolutionOne = numOneDouble * 0.01
        numSolutionTwo = numTwoDouble * 0.01
        numSolutionThree = numThreeDouble * 0.01
        currentWorth = 1 - numSolutionThree
        currentGradePercentage = currentWorth * numSolutionOne
        equationFactorOne = numSolutionTwo / numSolutionThree
        equationFactorTwo = currentGradePercentage / numSolutionThree
        neededScore = equationFactorOne - equationFactorTwo
        finalneededScore = neededScore * 100
        finalneededRounded = round(finalneededScore * 100) / 100.0
        finalneededString = String(finalneededRounded)
        neededGrade.text = "\(finalneededString)%"
       
    }
    @IBAction func buttonClear(_ sender: Any) {
        currentGrade.text = ""
        desiredGrade.text = ""
        examGrade.text = ""
        neededGrade.text = "Grade Needed"
    }
}

