//
//  MockHomeViewRepository.swift
//  CleanArchitectureTests
//
//  Created by myung hoon on 21/04/2024.
//

import Combine
@testable import CleanArchitecture

final class MockHomeViewRepository: HomeViewRepositoryType {
    func fetchHomeImageString() -> AnyPublisher<String, Never> {
        Just("mockImageString").eraseToAnyPublisher()
    }
}
