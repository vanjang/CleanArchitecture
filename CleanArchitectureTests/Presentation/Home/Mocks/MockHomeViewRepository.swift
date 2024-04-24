//
//  MockHomeViewRepository.swift
//  CleanArchitectureTests
//
//  Created by myung hoon on 21/04/2024.
//

import Combine
@testable import CleanArchitecture

final class MockHomeViewRepository: HomeViewRepositoryType {
    func fetchHomeImageString() -> AnyPublisher<String, Error> {
        Just("mockImageString")
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
