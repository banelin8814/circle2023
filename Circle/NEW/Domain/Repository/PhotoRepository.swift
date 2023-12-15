//
//  PhotoRepository.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/18.
//

import Foundation
// 定義對照片（Photo）進行操作的介面
protocol PhotoRepository {
    // 拍攝照片，完成時回呼通知結果
    func takePhoto(user: User, completion: @escaping (Result<Photo, Error>) -> Void)
    
    // 授予使用者與好友拍照的權限，完成時回呼通知結果
    func grantPhotoPermission(user: User, friend: User, completion: @escaping (Result<Void, Error>) -> Void)
    
    // 其他相關的方法...
}
