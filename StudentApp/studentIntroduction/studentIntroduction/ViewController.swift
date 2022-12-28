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
    
    
// Button Controls and Label output for number of Pets
    
    @IBOutlet weak var popUpAnimalButton: UIButton!
    @IBOutlet weak var schoolYearSegment: UISegmentedControl!
    @IBOutlet weak var petCountStpr: UIStepper!
    @IBOutlet weak var morePetSwitch: UISwitch!
    @IBOutlet weak var numOfPets: UILabel!
    
    
    
    //Function Section
    
    
    /*
     This function handles changes in the stepper switch and relays them to the num of Pets label.
     */
    @IBAction func stepperDidChange(_ sender: UIStepper) {
    numOfPets.text = "\(Int(sender.value))"
   }
    
    
    //Handles setting up the options present in our popup button in popUpAnimalButton and allows selection of different student animals
    @IBAction func buttonPressed() {
        let optionClosure = {(action : UIAction) in print(action.title)}
        
        //This is where we begin to add additional animal selections below
        popUpAnimalButton.menu = UIMenu(children : [
            UIAction(title: "What Animal Do you have?", state : .on, handler: optionClosure),
            UIAction(title: "Cats",  handler: optionClosure),
            UIAction(title: "Dogs",  handler: optionClosure)])
        
        popUpAnimalButton.showsMenuAsPrimaryAction = true
        popUpAnimalButton.changesSelectionAsPrimaryAction = true
    
    }
    


    
    /*
     This Function handles providing an alert box that introduces the student
     */
    
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        
        // Let's us chose the title we have selected from the segmented control
        let year = schoolYearSegment.titleForSegment(at: schoolYearSegment.selectedSegmentIndex)
        
        // Creating a variable of type string, that holds an introduction. The introduction interpolates the values from the text fields provided.
        // Currently we can only present the information in a print statement. However, this lets us verify that our app is printing out what is intended!
        let introduction = "My name is \(frstNTxtField.text!) \(lstNTxtField.text!) and I attend \(schoolTxtField.text!). I am currently in my \(year!) year and I own \(numOfPets.text!) \(popUpAnimalButton.titleLabel?.text ?? ""). It is \(morePetSwitch.isOn) that I want more pets." + "\n" +  popUpButtonSelectionChanged(popUpAnimalButton)
        
        // Creates the alert where we pass in our message, which our introduction.
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        // A way to dismiss the box once it pops up
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        
        // Passing this action to the alert controller so it can be dismissed
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
        
    
    /*
     This function adds an animal emoji to the alertbox introduction in the
     introduceSelfDidTapped function
     */
    func popUpButtonSelectionChanged(_ sender: UIButton) -> String{
        let selectedItem = sender.titleLabel?.text
        
        if selectedItem == "Cats" {
            return("🐱")
        } else if selectedItem == "Dogs" {
            return("🐶")
        }
        return("🤖")
        
    }
    
    

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.view.backgroundColor = UIColor.tintColor
    
        //Changing the background color to a custom black
        self.view.backgroundColor = UIColor.white
        
        //Sets up our pop button slection for popUpAnimalButton
        buttonPressed()
        
        
        //Makes our animal selection button have rounded edges
        popUpAnimalButton.layer.cornerRadius = 10
    }



}

