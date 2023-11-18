//
//  CheckLocationPermission).swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/17.
//

import Foundation
protocol CheckLocationPermissionUseCase {
    func checkLocationPermission(completion: @escaping (Result<Bool, Error>) -> Void)
}

class CheckLocationPermissionUseCaseImpl: CheckLocationPermissionUseCase {
    let locationService: LocationService // 假設有一個 LocationService 來處理位置相關的邏輯

    init(locationService: LocationService) {
        self.locationService = locationService
    }

    func checkLocationPermission(completion: @escaping (Result<Bool, Error>) -> Void) {
        // 檢查使用者是否已經獲得定位權限
        locationService.checkPermission { result in
            switch result {
            case .success(let hasPermission):
                completion(.success(hasPermission))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
