//
//  CollectionPageUseCases.swift
//  CleanArchitecture
//
//  Created by myung hoon on 22/04/2024.
//

import Combine

protocol CollectionPageUseCaseType {
    func getArtObject() -> AnyPublisher<[ArtObject], Never>
}

final class CollectionPageUseCases: CollectionPageUseCaseType {
    let repository: CollectionPageRepositoryType
    
    init(repository: CollectionPageRepositoryType) {
        self.repository = repository
    }
    
    func getArtObject() -> AnyPublisher<[ArtObject], Never> {
        repository.fetchCollection().map { $0.artObjects }.eraseToAnyPublisher()
    }
}
