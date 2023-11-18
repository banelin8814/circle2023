//
//  TakePhoto.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/17.
//

import Foundation
protocol TakePhotoUseCase {
    func takePhoto(user: User, friend: User, completion: @escaping (Result<Post, Error>) -> Void)
}

class TakePhotoUseCaseImpl: TakePhotoUseCase {
    let photoService: PhotoService // 假設有一個 PhotoService 來處理拍照相關的邏輯
    let postRepository: PostRepository // 假設有一個 PostRepository 來處理貼文相關的資料存取

    init(photoService: PhotoService, postRepository: PostRepository) {
        self.photoService = photoService
        self.postRepository = postRepository
    }

    func takePhoto(user: User, friend: User, completion: @escaping (Result<Post, Error>) -> Void) {
        // 使用相機服務拍照
        photoService.takePhoto { result in
            switch result {
            case .success(let photo):
                // 創建一篇貼文
                let post = Post(user: user, friend: friend, photo: photo)
                
                // 將貼文存入資料庫
                postRepository.savePost(post: post) { result in
                    switch result {
                    case .success:
                        completion(.success(post))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
