//
//  ArticlesTableViewController.swift
//  LearnRPG
//
//  Created by g on 4/27/19.
//  Copyright © 2019 cst495. All rights reserved.
//

import UIKit

class ArticlesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func LogoutButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
  
}
