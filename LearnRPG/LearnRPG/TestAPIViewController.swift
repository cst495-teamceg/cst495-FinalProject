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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        struct User: Codable{
            //            struct birthday: Codable {
            //                var day: Int
            //                var month: Int
            //                var year: Int
            //            }
            var birthday: String
            var email: String
            var firstName: String
            var lastName: String
            var password: String
            var permissionId: Int
            var phoneNumber: String
            var userId: Int
            var username: String
        }
        
        guard let url = URL(string: "http://localhost:8080/users/getAll")
            else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do {
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                print(jsonResponse) //Response result
                
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                print(jsonArray)
                
                //Now get title value
                guard let userName = jsonArray[1]["username"] as? String else { return };
                print(userName) // delectus aut autem
                DispatchQueue.main.async { // Correct
                    self.testLabel.text = userName
                }
                /* Not working yet
                 //here dataResponse received from a network request
                 let decoder = JSONDecoder()
                 let model = try decoder.decode(User.self, from:
                 dataResponse) //Decode JSON Response Data
                 print(model.userId) //Output - 1221 catch let parsingError {
                 */
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
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
