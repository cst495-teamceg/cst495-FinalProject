//
//  TestAPIViewController.swift
//  LearnRPG
//
//  Created by g on 4/27/19.
//  Copyright © 2019 cst495. All rights reserved.
//

import UIKit
import Alamofire

class TestAPIViewController: UIViewController {
    
    
    @IBOutlet weak var testLabel: UILabel!
    
    struct User: Codable{
        var classId: Int
        var experience: Int
        var level: Int
        var passId: Int?
        var password: String
        var readArticles: [Int?]
        var username: String
    }
    
    func authUser (pusername: String, ppassword: String) -> String {
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
        return val
        
    }
    
    func getUsers() {
        let endpoint = GlobalVariables.sharedManager.GET_ALL_USERS
        guard let url = URL(string: endpoint)
            else {print("---FAILED IN GUARD--")
                return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode([User].self, from:
                    dataResponse) //Decode JSON Response Data
                print("----SUCCESS: first user:" + model[0].username)//works
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getUsers()
        let authVal = authUser(pusername: "admin", ppassword: "admin")
        let a:Int? = Int(authVal)
        if (authVal != "-1") {
            GlobalVariables.sharedManager.setPassId(newPassId: a ?? -1)
        }

        

//
//                guard let jsonArray = jsonResponse as? [[String: Any]] else {
//                    return
//                }
//                //print(jsonArray[0]["username"])
//                //var un = jsonArray[0]["username"] as! String
//
//                var gb = "\(GlobalVariables.sharedManager.myName)"
//                print(gb)
                //Now get title value
//                guard let classId = jsonArray[0] as? String else { return };
//                print(classId) // delectus aut autem
//                DispatchQueue.main.async { // Correct
//                    self.testLabel.text = classId
//                }
                 //here dataResponse received from a network request
//                 let decoder = JSONDecoder()
//                 let model = try decoder.decode(User.self, from:
//                 dataResponse) //Decode JSON Response Data
//                 print(model.username) //Output - 1221 catch let parsingError {
 

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
