//
//  GlobalVariables.swift
//  LearnRPG
//
//  Created by g on 4/29/19.
//  Copyright © 2019 cst495. All rights reserved.
//

import Foundation

class GlobalVariables {
    lazy var BASE_URL = "http://iphone.devsofthewest.com/"
    lazy var GET_ALL_USERS = BASE_URL + "user/getAll"
    lazy var AUTH_USER = BASE_URL + "user/authenticate"
    private var username: String
    private var token: Int
    init(){
        self.username = "null"
        self.token = -1
    }
    func getUsername() -> String {
        return username
    }
    func setUsername(newUsername: String){
        self.username = newUsername
    }
    func getToken() -> Int {
        return token
    }
    func setToken(newToken: Int) {
        self.token = newToken
    }
//    class User {
//        var username: String
//        var token: String
//        init(username: String, token: String) {
//            self.username = username
//            self.token = token
//        }
//        
//        
//    }

    
    
    // Here is how you would get to it without there being a global collision of variables.
    // , or in other words, it is a globally accessable parameter that is specific to the
    // class.
    class var sharedManager: GlobalVariables {
        struct Static {
            static let instance = GlobalVariables()
        }
        return Static.instance
    }
}
