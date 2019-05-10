//
//  ProfileViewController.swift
//  LearnRPG
//
//  Created by g on 4/15/19.
//  Copyright © 2019 cst495. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var xpLabel: UILabel!
    
    @IBAction func ProfileDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("==========")
        print(GlobalVariables.sharedManager.getUsername())
        //Set username
        self.usernameLabel.text = GlobalVariables.sharedManager.getUsername()
        
        //Set level
        let levelStr = String(GlobalVariables.sharedManager.getLevel())
        self.levelLabel.text = levelStr
        
        //Set xp
        let xpStr = String(GlobalVariables.sharedManager.getXp())
        self.xpLabel.text = xpStr
        // Do any additional setup after loading the view.
        view.setNeedsDisplay()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.levelLabel.text = String(GlobalVariables.sharedManager.getLevel())
        self.xpLabel.text = String(GlobalVariables.sharedManager.getXp())
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
