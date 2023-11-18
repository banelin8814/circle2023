//
//  ViewPostsOnCalendar.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/17.
//

import Foundation

protocol ViewPostsOnCalendarUseCase {
    func viewPostsOnCalendar(user: User, completion: @escaping (Result<[Post], Error>) -> Void)
}

class ViewPostsOnCalendarUseCaseImpl: ViewPostsOnCalendarUseCase {
    let postRepository: PostRepository // 假設有一個 PostRepository 來處理貼文相關的資料存取

    init(postRepository: PostRepository) {
        self.postRepository = postRepository
    }

    func viewPostsOnCalendar(user: User, completion: @escaping (Result<[Post], Error>) -> Void) {
        // 從資料庫或其他資料源中獲取使用者在日曆上的貼文
        postRepository.fetchPostsOnCalendar(user: user) { result in
            switch result {
            case .success(let posts):
                completion(.success(posts))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
