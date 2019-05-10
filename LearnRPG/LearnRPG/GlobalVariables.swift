//
//  GlobalVariables.swift
//  LearnRPG
//
//  Created by g on 4/29/19.
//  Copyright © 2019 cst495. All rights reserved.
//

import Foundation
import Alamofire

struct Article {
    var title: String
    var content: String
}

class GlobalVariables {
    //statics
    lazy var BASE_URL = "http://iphone.devsofthewest.com/"
    lazy var GET_ALL_USERS = BASE_URL + "user/getAll"
    lazy var AUTH_USER = BASE_URL + "user/authenticate"
    lazy var LEVEL1_THRESHHOLD = 20
    lazy var LEVEL2_THRESHHOLD = 30
    lazy var LEVEL3_THRESHHOLD = 40
    
    //members
    private var username: String
    private var passId: Int
    private var xp: Int
    private var level: Int
    private var classId: Int
    private var readArticles: [Int]
    public var articles: [Article]

    //Default Constructor
    init(){
        self.username = "null"
        self.passId = -1
        self.xp = 0
        self.level = 0
        self.classId = 0
        self.readArticles = []
        self.articles = []
        self.seedArticles()
    }
    
    //OverloadedConstructor
    init(newUsername: String, newPassId: Int, newClassId: Int){
        self.username = newUsername
        self.passId = newPassId
        self.xp = 0
        self.level = 1
        self.classId = newClassId
        self.readArticles = []
        self.articles = []
        self.seedArticles()
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
        self.addLevel();
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
    
    private func seedArticles() {
        self.articles.append(Article(title: "Apollo 12", content:"Apollo 12 was the sixth manned flight in the United States Apollo program and the second to land on the Moon. It was launched on November 14, 1969, from the Kennedy Space Center, Florida, four months after Apollo 11. Commander Charles 'Pete' Conrad and Lunar Module Pilot Alan L. Bean performed just over one day and seven hours of lunar surface activity while Command Module Pilot Richard F. Gordon remained in lunar orbit. The landing site for the mission was located in the southeastern portion of the Ocean of Storms./n\nUnlike the first landing on Apollo 11, Conrad and Bean achieved a precise landing at their expected location, the site of the Surveyor 3 unmanned probe, which had landed on April 20, 1967. They carried the first color television camera to the lunar surface on an Apollo flight, but transmission was lost after Bean accidentally destroyed the camera by pointing it at the Sun. On one of two moonwalks, they visited the Surveyor and removed some parts for return to Earth. The mission ended on November 24 with a successful splashdown."))
        self.articles.append(Article(title: "Article 2", content:" Mesquite mouse\n\nThe mesquite mouse (Peromyscus merriami) is a species of rodent in the family Cricetidae found in Mexico and in Arizona in the United States.[1]"))
                self.articles.append(Article(title: "Article 3", content:"Is"))
                self.articles.append(Article(title: "Article 4", content:"Really"))
                self.articles.append(Article(title: "Article 5", content:" Tough"))
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
