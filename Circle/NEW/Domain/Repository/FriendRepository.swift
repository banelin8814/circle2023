//
//  FriendRepository.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/18.
//

import Foundation
// 定義對朋友（Friend）進行操作的介面
protocol FriendRepository {
    // 將一位使用者（user）加為另一位使用者（friend）的好友，完成時回呼通知結果
    func addFriend(user: User, friend: User, completion: @escaping (Result<Void, Error>) -> Void)
    
    // 查詢指定使用者的好友列表，完成時回呼通知結果
    func fetchFriendList(userID: String, completion: @escaping (Result<[User], Error>) -> Void)
    
    // 其他相關的方法...
}
