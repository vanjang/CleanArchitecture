//
//  CollectionPageUseCases.swift
//  CleanArchitecture
//
//  Created by myung hoon on 22/04/2024.
//

import Combine

protocol CollectionPageUseCaseType {
    func getArtObject(load: PassthroughSubject<Void, Never>) -> AnyPublisher<[ArtObject], Error>
}

final class CollectionPageUseCases: CollectionPageUseCaseType {
    let repository: CollectionPageRepositoryType
    
    init(repository: CollectionPageRepositoryType) {
        self.repository = repository
    }
    
    func getArtObject(load: PassthroughSubject<Void, Never>) -> AnyPublisher<[ArtObject], Error> {
        repository.fetchCollection(load: load).map { $0.artObjects }.eraseToAnyPublisher()
    }
}
