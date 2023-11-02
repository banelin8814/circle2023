//
//  Model.swift
//  Circle
//
//  Created by 林佑淳 on 2023/10/31.
//

import Foundation

struct UserReponse: Codable {
    let data: [PersonResponse]
}
struct PersonResponse: Codable{
    let email:String
    let firstName:String
    let lastName:String
}
