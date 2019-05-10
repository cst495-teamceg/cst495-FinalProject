//
//  ArticleViewController.swift
//  LearnRPG
//
//  Created by g on 4/15/19.
//  Copyright © 2019 cst495. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    @IBOutlet weak var articleContentTextView: UITextView!
    
    @IBOutlet weak var articleTitleContentTextView: UILabel!
    
    @IBOutlet weak var countDownTimerLabel: UILabel!
    
    @IBOutlet weak var timerView: UIView!

    var articleTitle: String!
    var articleContent: String!
    
    var seconds = 60
    var timer = Timer()
    var proceed = true//For testing
//    var proceed = false //Use this
    
    func getWordCount() -> (Int){
        let words = articleContentTextView.text.components(separatedBy: .whitespacesAndNewlines)
        _ = words.filter({ (word) -> Bool in
            word != ""
        })
        print(words.count)
        return words.count
        //print(wordCount)
    }
    
    func timeToReadInSeconds(words: Int) -> (Int){
        return words / 6
    }
    
    @objc func counter() {
        seconds -= 1
        countDownTimerLabel.text = String(seconds)
        if (seconds == 0){
            timer.invalidate()
            timerZero()
        }
    }
    
    func timerZero() {
        countDownTimerLabel.text = "Finish"
        timerView.backgroundColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
        proceed = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articleTitleContentTextView.text = articleTitle
        articleContentTextView.text = articleContent
        let words = getWordCount()
        seconds = timeToReadInSeconds(words: words)
        self.countDownTimerLabel.text = String(seconds)
        
        //pauses when scrolling
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ArticleViewController.counter), userInfo: nil, repeats: true)
        
        //Solves pause on timer when scrolling bug
        timer = Timer(timeInterval: 1, target: self, selector: #selector(ArticleViewController.counter), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
        // Do any additional setup after loading the view.
    }
    
    //Makes sure scrollbar is scrolled to top by default
    override func viewDidLayoutSubviews() {
            self.articleContentTextView.setContentOffset(.zero, animated: false)
    }
    
    
    @IBAction func proceedTapAction(_ sender: Any) {
        print("tap")
        if (proceed){
//            performSegue(withIdentifier: "RewardXP", sender: self)
            
            GlobalVariables.sharedManager.addXp(addXp: 10)
            if (GlobalVariables.sharedManager.checkIfLeveledUp()){
                GlobalVariables.sharedManager.levelUp()
                let alertController = UIAlertController(title: "Level Up!", message:
                    "Congrats! You leveled up!", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
//                self.performSegue(withIdentifier: "returnFromModal2", sender: self)
            } else {
//                performSegue(withIdentifier: "LevelUpSegue", sender: self)
//                //self.dismiss(animated: true, completion: {});
//                self.navigationController?.popViewController(animated: true);
                let alertController = UIAlertController(title: "Article Complete!", message:
                    "You gained 10 XP!", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                
                self.present(alertController, animated: true, completion: nil)
                
            }
            
            
            
        }
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
