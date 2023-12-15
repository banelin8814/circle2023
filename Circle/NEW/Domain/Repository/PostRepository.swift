//
//  PostRepository.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/18.
//

import Foundation
// 定義對貼文（Post）進行操作的介面
protocol PostRepository {
    // 建立新的貼文，完成時回呼通知結果
    func createPost(post: Post, completion: @escaping (Result<Void, Error>) -> Void)
    
    // 查詢指定使用者在指定日期的所有貼文，完成時回呼通知結果
    func viewPostsOnCalendar(userID: String, date: Date, completion: @escaping (Result<[Post], Error>) -> Void)
    
    // 其他相關的方法...
}
