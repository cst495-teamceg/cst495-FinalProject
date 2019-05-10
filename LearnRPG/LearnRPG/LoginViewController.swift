//
//  LoginViewController.swift
//  LearnRPG
//
//  Created by g on 4/15/19.
//  Copyright © 2019 cst495. All rights reserved.
//

import UIKit
import Alamofire

struct User: Codable{
    var classId: Int
    var experience: Int
    var level: Int
    var passId: Int?
    var password: String
    var readArticles: [Int?]
    var username: String
}

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameLoginField: UITextField!
    
    @IBOutlet weak var passwordLoginField: UITextField!
    
    @IBAction func loginButtonAction(_ sender: Any) {
        authUser(pusername: usernameLoginField.text!, ppassword: passwordLoginField.text!)
//        let a:Int? = Int(authVal)
//        if (a != -1) {
//            //GlobalVariables.sharedManager.setPassId(newPassId: a ?? -1)
//            self.getUser(pusername: usernameLoginField.text!)
//        } else {
//            //alert
//            print("fail!-----!")
//        }
    }
    
    func authUser(pusername: String, ppassword: String) {
        if (pusername == "learner" && ppassword == "learner"){
            GlobalVariables.sharedManager.setUser(newUsername: "learner", newPassId: 1, newClassId: 1)
            performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }
    
    //return -1 if invalid and other int if true
    func authUserBackend (pusername: String, ppassword: String)  {
        let parameters: Parameters = [    "username": pusername,
                                          "password": ppassword,
        ]
        var val = "-1"
        Alamofire.request(GlobalVariables.sharedManager.AUTH_USER, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
                val = utf8Text
            }
        }
        print("RETURN VAL= " + val)

    }
    
    func getUser (pusername: String) -> Void {
        let parameters: Parameters = [    "username": pusername        ]
        let user = User.self
        Alamofire.request(GlobalVariables.sharedManager.GET_USER, method: .get, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            if let JSON = response.result.value {
                print("json: \(JSON)")
            }
            print("fail-----")
        }

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
