//
//  ViewController.swift
//  studentIntroduction
//
//  Created by Jozef Vargas on 12/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    
// Text Field Areas
    @IBOutlet weak var frstNTxtField: UITextField!
    @IBOutlet weak var lstNTxtField: UITextField!
    @IBOutlet weak var schoolTxtField: UITextField!
    
    
// Button Controls
    @IBOutlet weak var schoolYearSegment: UISegmentedControl!
    @IBOutlet weak var petCountStpr: UIStepper!
    @IBOutlet weak var morePetSwitch: UISwitch!
    
    
    @IBOutlet weak var numOfPets: UILabel!
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
       
    numOfPets.text = "\(Int(sender.value))"
   }
    
    
    
    
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        
        // Let's us chose the title we have selected from the segmented control
        let year = schoolYearSegment.titleForSegment(at: schoolYearSegment.selectedSegmentIndex)
        
        // Creating a variable of type string, that holds an introduction. The introduction interpolates the values from the text fields provided.
        // Currently we can only present the information in a print statement. However, this lets us verify that our app is printing out what is intended!
        let introduction = "My name is \(frstNTxtField.text!) \(lstNTxtField.text!) and I attend \(schoolTxtField.text!). I am currently in my \(year!) year and I own \(numOfPets.text!) dogs. It is \(morePetSwitch.isOn) that I want more pets."

        
        
        // Creates the alert where we pass in our message, which our introduction.
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        // A way to dismiss the box once it pops up
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        
        // Passing this action to the alert controller so it can be dismissed
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }


    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

