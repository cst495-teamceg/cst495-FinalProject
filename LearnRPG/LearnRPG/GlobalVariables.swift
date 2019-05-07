//
//  GlobalVariables.swift
//  LearnRPG
//
//  Created by g on 4/29/19.
//  Copyright © 2019 cst495. All rights reserved.
//

import Foundation
import Alamofire

class GlobalVariables {
    //statics
    lazy var BASE_URL = "http://iphone.devsofthewest.com/"
    lazy var GET_ALL_USERS = BASE_URL + "user/getAll"
    lazy var AUTH_USER = BASE_URL + "user/authenticate"
    lazy var LEVEL1_THRESHHOLD = 1
    lazy var LEVEL2_THRESHHOLD = 2
    lazy var LEVEL3_THRESHHOLD = 3
    
    //members
    private var username: String
    private var passId: Int
    private var xp: Int
    private var level: Int
    private var classId: Int
    private var readArticles: [Int]

    //Default Constructor
    init(){
        self.username = "null"
        self.passId = -1
        self.xp = 0
        self.level = 0
        self.classId = 0
        self.readArticles = []
    }
    
    //OverloadedConstructor
    init(newUsername: String, newPassId: Int, newClassId: Int){
        self.username = newUsername
        self.passId = newPassId
        self.xp = 0
        self.level = 1
        self.classId = newClassId
        self.readArticles = []
    }
    
    //Getters and Setters
    func getUsername() -> String {
        return username
    }
    func setUsername(newUsername: String){
        self.username = newUsername
    }
    func getPassId() -> Int {
        return passId
    }
    func setPassId(newPassId: Int) {
        self.passId = newPassId
    }
    func getXp() -> Int {
        return xp
    }
    func resetXp() {
        self.xp = 0
    }
    func addXp(addXp: Int) {
        self.xp += addXp
        if (checkIfLeveledUp()){
            levelUp()
        }
    }
    func getLevel() -> Int {
        return level
    }
    func addLevel() {
        self.level += 1
    }
    func getClassId() -> Int {
        return classId
    }
    func setClassId(newClassId: Int) {
        self.classId = newClassId
    }
    func getReadArticles() -> [Int] {
        return readArticles
    }
    func addReadArticle(articleNum: Int) {
        readArticles.append(articleNum)
    }
    
    //Member functions
    func levelUp(){
        //do something
        print("Leveled Up!!!")
    }
    func checkIfLeveledUp() -> Bool {
        let curLevel: Int = self.level
        switch curLevel {
            case 1:
                if (self.getXp() > LEVEL1_THRESHHOLD){
                    self.addLevel()
                    self.resetXp()
                    return true
                } else {
                   return false
                }
            case 2:
                if (self.getXp() > LEVEL2_THRESHHOLD){
                    self.addLevel()
                    self.resetXp()
                    return true
                } else {
                    return false
                }
            case 3:
                if (self.getXp() > LEVEL1_THRESHHOLD){
                    self.addLevel()
                    self.resetXp()
                    return true
                } else {
                    return false
                }
            default:
                return false
        }
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
