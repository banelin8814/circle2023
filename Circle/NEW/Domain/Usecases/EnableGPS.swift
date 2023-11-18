//
//  EnableGPS.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/17.
//

import Foundation
// 定義一個協定，描述 EnableGPSUseCase 的功能
protocol EnableGPSUseCase {
    func enableGPS(completion: @escaping (Result<Void, Error>) -> Void)
}

// 實作 EnableGPSUseCase
class EnableGPSUseCaseImpl: EnableGPSUseCase {
    // 實際的實現可能涉及到與定位服務的互動
    func enableGPS(completion: @escaping (Result<Void, Error>) -> Void) {
        // 在這裡啟用 GPS 定位功能
        // 可以透過 Core Location 框架進行相應的處理
        // 完成後呼叫 completion 回傳結果
        completion(.success(()))
    }
}
