//
//  RewardXPViewController.swift
//  LearnRPG
//
//  Created by g on 5/8/19.
//  Copyright © 2019 cst495. All rights reserved.
//

import UIKit

class RewardXPViewController: UIViewController {

    @IBAction func CompleteButton(_ sender: Any) {
        GlobalVariables.sharedManager.addXp(addXp: 10)
        if (GlobalVariables.sharedManager.checkIfLeveledUp()){
            GlobalVariables.sharedManager.levelUp()
            self.performSegue(withIdentifier: "returnFromModal2", sender: self)
        } else {
            performSegue(withIdentifier: "LevelUpSegue", sender: self)
            //self.dismiss(animated: true, completion: {});
           self.navigationController?.popViewController(animated: true);
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

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
