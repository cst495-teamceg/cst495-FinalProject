//
//  TestAPIViewController.swift
//  LearnRPG
//
//  Created by g on 4/27/19.
//  Copyright © 2019 cst495. All rights reserved.
//

import UIKit

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
    
    func authUser (pusername: String, ppassword: String) {
        let endpoint = GlobalVariables.sharedManager.AUTH_USER
        guard let serviceUrl = URL(string: endpoint)
            else {return}
        let parameterDictionary = ["username" : pusername, "password" : ppassword]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        
    }
    
    func getUsers() {
        let endpoint = GlobalVariables.sharedManager.GET_ALL_USERS
        guard let url = URL(string: endpoint)
            else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode([User].self, from:
                    dataResponse) //Decode JSON Response Data
                print(model[0].username)
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
        authUser(pusername: "admin", ppassword: "admin")

        

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
