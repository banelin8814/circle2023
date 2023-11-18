//
//  CheckProximityWithFriend.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/17.
//

import Foundation

// 定義一個協定，描述 CheckProximityWithFriendUseCase 的功能
protocol CheckProximityWithFriendUseCase {
    func checkProximity(user: User, friend: User, completion: @escaping (Result<Bool, Error>) -> Void)
}

// 實作 CheckProximityWithFriendUseCase
class CheckProximityWithFriendUseCaseImpl: CheckProximityWithFriendUseCase {
    func checkProximity(user: User, friend: User, completion: @escaping (Result<Bool, Error>) -> Void) {
        // 在這裡實作確認是否和好友在靠近的地點的邏輯
        // 你可能需要使用 Core Location 框架來計算使用者和好友之間的距離
        // 如果距離在預定範圍內，則回傳 true，否則回傳 false
        
        let userLocation = CLLocation(latitude: user.latitude, longitude: user.longitude)
        let friendLocation = CLLocation(latitude: friend.latitude, longitude: friend.longitude)
        
        let distance = userLocation.distance(from: friendLocation)
        let proximityRange: Double = 10.0 // 十米的範圍
        
        if distance <= proximityRange {
            completion(.success(true))
        } else {
            completion(.success(false))
        }
    }
}
