//
//  MockHomeViewModel.swift
//  CleanArchitectureTests
//
//  Created by myung hoon on 21/04/2024.
//

import Combine
@testable import CleanArchitecture

final class MockHomeViewModel: HomeViewModelType {
    private var cancellables: [AnyCancellable] = []
    private let action: HomeViewModelAction
    private let useCase: HomeViewUseCaseType
    
    init(useCase: HomeViewUseCaseType, action: HomeViewModelAction) {
        self.useCase = useCase
        self.action = action
    }

    func connect(input: CleanArchitecture.HomeViewModelInput) -> CleanArchitecture.HomeViewModelOutput {
        input
            .sink(receiveValue: action.pushToCollection)
            .store(in: &cancellables)
        
        return HomeViewModelOutput(useCase.getHomeImageString()).eraseToAnyPublisher()
    }
}
