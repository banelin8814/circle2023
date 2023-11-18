//
//  GrantPhotoPermission.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/17.
//

import Foundation
protocol GrantPhotoPermissionUseCase {
    func grantPermission(user: User, friend: User, completion: @escaping (Result<Bool, Error>) -> Void)
}

class GrantPhotoPermissionUseCaseImpl: GrantPhotoPermissionUseCase {
    let locationService: LocationService // 假設有一個 LocationService 來處理位置相關的邏輯

    init(locationService: LocationService) {
        self.locationService = locationService
    }

    func grantPermission(user: User, friend: User, completion: @escaping (Result<Bool, Error>) -> Void) {
        // 檢查使用者和朋友是否在相同空間下
        locationService.checkProximity(user: user, friend: friend) { result in
            switch result {
            case .success(let isProximity):
                // 根據檢查結果授權拍照權限
                if isProximity {
                    completion(.success(true))
                } else {
                    completion(.success(false))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
