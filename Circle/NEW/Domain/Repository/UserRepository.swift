//
//  UserRepository.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/18.
//

import Foundation
// 定義對使用者（User）進行操作的介面
protocol UserRepository {
    // 註冊新使用者，完成時回呼通知結果
    func registerUser(user: User, completion: @escaping (Result<Void, Error>) -> Void)
    
    // 根據使用者的電子郵件查詢使用者，完成時回呼通知結果
    func getUserByEmail(email: String, completion: @escaping (Result<User?, Error>) -> Void)
    
    // 其他相關的方法...
}
