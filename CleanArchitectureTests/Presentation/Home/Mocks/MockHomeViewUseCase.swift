//
//  MockHomeViewUseCase.swift
//  CleanArchitectureTests
//
//  Created by myung hoon on 21/04/2024.
//

import Combine
@testable import CleanArchitecture

final class MockHomeViewUseCase: HomeViewUseCaseType {
    let mockRepository: HomeViewRepositoryType
    
    init(mockRepository: HomeViewRepositoryType) {
        self.mockRepository = mockRepository
    }
    
    func getHomeImageString() -> AnyPublisher<String, Error> {
        mockRepository.fetchHomeImageString()
    }
}
