//
//  RegisterViewController.swift
//  LearnRPG
//
//  Created by g on 4/27/19.
//  Copyright © 2019 cst495. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBAction func registerButtonAction(_ sender: Any) {
        var valid = false
        //1: check if input is correct length
        if (usernameField.text!.count < 4 && passwordField.text!.count < 4 && confirmPasswordField.text!.count < 4){
            let alertController = UIAlertController(title: "Learn RPG", message:
                "Input must be greater than 3 characters", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
            
            //verificationLabel.text = "Input must be greater than 3 characters"
        }
        //2: passwords must match
        else if (passwordField.text != confirmPasswordField.text){
            //verificationLabel.text = "Passwords do not match"
            let alertController = UIAlertController(title: "Learn RPG", message:
                "Passwords do not match", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        } else {
            valid = true
        }
        
        //3
        
        //4: pass: go to next screen
        if (valid) {
            performSegue(withIdentifier: "SelectCharSegue", sender: self)
        }
        
        
    }
    @IBOutlet weak var verificationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
