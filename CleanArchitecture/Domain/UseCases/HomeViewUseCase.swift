//
//  HomeViewUseCase.swift
//  CleanArchitecture
//
//  Created by myung hoon on 21/04/2024.
//

import Combine

protocol HomeViewUseCaseType {
    func fetch() -> AnyPublisher<String, Never>
}

final class HomeViewUseCase: HomeViewUseCaseType {
    let repository: HomeViewRepositoryType
    
    init(repository: HomeViewRepositoryType) {
        self.repository = repository
    }
    
    func fetch() -> AnyPublisher<String, Never> {
        repository.fetchHomeImageString()
    }
}
