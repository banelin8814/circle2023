//
//  User.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/16.
//

import Foundation

struct User {
    let id: String
    var nickname: String
    let email: String
    var profileImagePath: String
    var categoryIDs: [String] //指示使用者的興趣或偏好，可能用於推薦相關內容或功能。
}


