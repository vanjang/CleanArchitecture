//
//  CollectionPageRepositoryType.swift
//  CleanArchitecture
//
//  Created by myung hoon on 22/04/2024.
//

import Combine

protocol CollectionPageRepositoryType {
    func fetchCollection(load: PassthroughSubject<Void, Never>) -> AnyPublisher<Collection, Error>
}
