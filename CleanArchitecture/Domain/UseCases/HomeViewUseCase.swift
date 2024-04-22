//
//  HomeViewUseCase.swift
//  CleanArchitecture
//
//  Created by myung hoon on 21/04/2024.
//

import Combine

protocol HomeViewUseCaseType {
    func getHomeImageString() -> AnyPublisher<String, Never>
}

final class HomeViewUseCase: HomeViewUseCaseType {
    let repository: HomeViewRepositoryType
    
    init(repository: HomeViewRepositoryType) {
        self.repository = repository
    }
    
    func getHomeImageString() -> AnyPublisher<String, Never> {
        repository.fetchHomeImageString()
    }
}
