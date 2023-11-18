//
//  FetchFriendList.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/17.
//

import Foundation
// 定義一個協定，描述 FetchFriendListUseCase 的功能
protocol FetchFriendListUseCase {
    func fetchFriendList(completion: @escaping (Result<[User], Error>) -> Void)
}

// 實作 FetchFriendListUseCase
class FetchFriendListUseCaseImpl: FetchFriendListUseCase {
    let userRepository: UserRepository // 假設有一個 UserRepository 來處理使用者相關的資料存取

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func fetchFriendList(completion: @escaping (Result<[User], Error>) -> Void) {
        // 從資料庫或其他資料源中獲取使用者的好友列表
        userRepository.fetchFriends { result in
            switch result {
            case .success(let friends):
                completion(.success(friends))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
