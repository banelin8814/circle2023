//
//  CreatePostUseCase.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/17.
//

import Foundation

protocol CreatePostUseCase {
    func createPost(user: User, friend: User, photo: UIImage, completion: @escaping (Result<Post, Error>) -> Void)
}

class CreatePostUseCaseImpl: CreatePostUseCase {
    let postRepository: PostRepository // 假設有一個 PostRepository 來處理貼文相關的資料存取

    init(postRepository: PostRepository) {
        self.postRepository = postRepository
    }

    func createPost(user: User, friend: User, photo: UIImage, completion: @escaping (Result<Post, Error>) -> Void) {
        // 在這裡實作創建貼文的邏輯
        // 可能需要檢查是否在相同空間下，更新資料庫，等等
        // 完成後呼叫 completion 回傳結果
        completion(.success(/* 新創建的貼文 */))
    }
}
