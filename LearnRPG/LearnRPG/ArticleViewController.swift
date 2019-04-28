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
   
    @IBAction func ProceedToRateGesture(_ sender: Any) {
        if (proceed){
            performSegue(withIdentifier: "RateArticle", sender: self)        }
    }
    @IBAction func ProceedButtonAction(_ sender: Any) {

    }
    var seconds = 60
    var timer = Timer()
    var proceed = false
    
    
    
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
        return words / 5
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
        timerView.backgroundColor = .green
        proceed = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let words = getWordCount()
        seconds = timeToReadInSeconds(words: words)
        self.countDownTimerLabel.text = String(seconds)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ArticleViewController.counter), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    //Makes sure scrollbar is scrolled to top by default
    override func viewDidLayoutSubviews() {
    self.articleContentTextView.setContentOffset(.zero, animated: false)
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
