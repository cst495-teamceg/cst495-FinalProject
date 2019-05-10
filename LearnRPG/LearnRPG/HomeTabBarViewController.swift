//
//  HomeTabBarViewController.swift
//  LearnRPG
//
//  Created by g on 5/9/19.
//  Copyright © 2019 cst495. All rights reserved.
//

import UIKit

class HomeTabBarViewController: UITabBarController {
    @IBAction func LogoutButton(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
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
