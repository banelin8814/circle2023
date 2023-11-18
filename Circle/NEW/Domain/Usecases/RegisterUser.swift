//
//   RegisterUserUseCase.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/17.
//

import Foundation
// 定義一個協定，描述 RegisterUserUseCase 的功能
protocol RegisterUserUseCase {
    func registerUser(nickname: String, email: String, completion: @escaping (Result<User, Error>) -> Void)
}

// 實作 RegisterUserUseCase
class RegisterUserUseCaseImpl: RegisterUserUseCase {
    // 這裡可能還需要一個 UserRepository 來處理使用者相關的資料存取
    let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func registerUser(nickname: String, email: String, completion: @escaping (Result<User, Error>) -> Void) {
        // 做一些註冊前的檢查，例如檢查是否已經存在相同的電子郵件等

        // 創建一個新的使用者
        let newUser = User(
            id: UUID().uuidString,  // 使用 UUID 來生成唯一的使用者 ID
            nickname: nickname,
            email: email,
            profileImagePath: "",  // 可以在註冊後由使用者上傳頭像
            categoryIDs: []
        )

        // 儲存新使用者到資料庫
        userRepository.saveUser(newUser) { result in
            switch result {
            case .success:
                // 如果儲存成功，呼叫 completion 回傳新建立的使用者
                completion(.success(newUser))
            case .failure(let error):
                // 如果儲存失敗，呼叫 completion 回傳錯誤
                completion(.failure(error))
            }
        }
    }
}
