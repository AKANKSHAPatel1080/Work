//
//  StatusModel.swift
//  AssignmentFive
//
//  Created by IOS Training 2 on 12/08/22.
//

import Foundation


struct StatusResults: Decodable{
    let feedData: [UserData]?
}

struct UserData: Decodable{
    let userName : String
    let userId : Int
    let imageName : String
    let feed : String
    let feedId : Int
    let type : String
    

//    init(userName: String,userId: Int,type: String,imageName: String,feed : String, feedId: Int){
//    self.feed = feed
//        self.feedId = feedId
//    self.imageName = imageName
//        self.type = type
//        self.userId = userId
//        self.userName = userName
//}
    



        enum CodingKeys: String, CodingKey{
            case userName = "userName"
           case userId = "userId"
            case feed = "feed"
            case feedId = "feedId"
            case imageName = "imageName"
            case type = "type"
        }
    }

    
    

