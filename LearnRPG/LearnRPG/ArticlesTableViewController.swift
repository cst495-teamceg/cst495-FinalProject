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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell") as! ArticleTableViewCell
        let article = GlobalVariables.sharedManager.articles[indexPath.row]
        let title = article.title
        let content = article.content
        
        cell.articleTitleLabel!.text = title
        cell.articleContentLabel!.text = content
        
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
  
}
