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
    func fetchHomeImageString() -> AnyPublisher<String, Error> {
        let infoDictionary: AnyPublisher<String, Error> = localDataTransferService.request()
        return infoDictionary.eraseToAnyPublisher()
    }
}
