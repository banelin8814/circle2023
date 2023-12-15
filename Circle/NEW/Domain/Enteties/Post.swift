//
//  Post.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/17.
//

import Foundation

struct Post {
    let id: String
    let userID: String
    let content: String
    let timestamp: Date//貼文的發佈時間。
    var likeUserIDs: [String]
    var commentIDs: [String]
    var location: Location?
        
}
