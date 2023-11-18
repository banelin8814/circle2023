//
//  UpdateUserLocation.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/17.
//

import Foundation
protocol UpdateUserLocationUseCase {
    func updateUserLocation(user: User, newLocation: Location, completion: @escaping (Result<Void, Error>) -> Void)
}

class UpdateUserLocationUseCaseImpl: UpdateUserLocationUseCase {
    let locationService: LocationService // 假設有一個 LocationService 來處理位置相關的邏輯

    init(locationService: LocationService) {
        self.locationService = locationService
    }

    func updateUserLocation(user: User, newLocation: Location, completion: @escaping (Result<Void, Error>) -> Void) {
        // 更新使用者的地理位置
        locationService.updateUserLocation(user: user, newLocation: newLocation) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
