//
//  AddFriend.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/17.
//

import Foundation

protocol AddFriendUseCase {
    func addFriend(user: User, friend: User, completion: @escaping (Result<Void, Error>) -> Void)
}

class AddFriendUseCaseImpl: AddFriendUseCase {
    let friendshipRepository: FriendshipRepository // 假設有一個 FriendshipRepository 來處理好友相關的資料存取

    init(friendshipRepository: FriendshipRepository) {
        self.friendshipRepository = friendshipRepository
    }

    func addFriend(user: User, friend: User, completion: @escaping (Result<Void, Error>) -> Void) {
        // 將好友關係存入資料庫
        friendshipRepository.addFriend(user: user, friend: friend) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
