//
//  HomeViewRepository.swift
//  CleanArchitecture
//
//  Created by myung hoon on 21/04/2024.
//

import Foundation
import Combine

final class HomeViewRepository {
    let localDataTransferService: DataTransferService
    
    init(localDataTransferService: DataTransferService) {
        self.localDataTransferService = localDataTransferService
    }
}

extension HomeViewRepository: HomeViewRepositoryType {
    func fetchHomeImageString() -> AnyPublisher<String, Never> {
        let infoDictionary: AnyPublisher<(Result<String, any Error>), Never> = localDataTransferService.request()
        return infoDictionary
            .map { result -> String in
                switch result {
                case .success(let imageString):
                    return imageString
                default: return ""
                }
            }
            .eraseToAnyPublisher()
    }
}
