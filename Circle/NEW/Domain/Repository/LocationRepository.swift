//
//  LocationRepository.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/18.
//

import Foundation
// 定義對位置（Location）進行操作的介面
protocol LocationRepository {
    // 啟用 GPS 定位，完成時回呼通知結果
    func enableGPS(completion: @escaping (Result<Void, Error>) -> Void)
    
    // 更新使用者的位置資訊，完成時回呼通知結果
    func updateUserLocation(user: User, location: Location, completion: @escaping (Result<Void, Error>) -> Void)
    
    // 檢查應用程式是否擁有位置權限，完成時回呼通知結果
    func checkLocationPermission(completion: @escaping (Result<Bool, Error>) -> Void)
    
    // 檢查使用者與好友之間的距離是否在可接受的範圍內，完成時回呼通知結果
    func checkProximityWithFriend(user: User, friend: User, completion: @escaping (Result<Bool, Error>) -> Void)
    
    // 通知好友彼此之間的接近，完成時回呼通知結果
    func notifyFriendsProximity(user: User, completion: @escaping (Result<Void, Error>) -> Void)
    
    // 其他相關的方法...
}
