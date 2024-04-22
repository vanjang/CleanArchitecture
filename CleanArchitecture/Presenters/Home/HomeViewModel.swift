//
//  HomeViewModel.swift
//  CleanArchitecture
//
//  Created by myung hoon on 21/04/2024.
//

import Combine

final class HomeViewModel: HomeViewModelType {
    private var cancellables: [AnyCancellable] = []
    private let action: HomeViewModelAction
    private let useCase: HomeViewUseCaseType
    
    init(useCase: HomeViewUseCaseType, action: HomeViewModelAction) {
        self.useCase = useCase
        self.action = action
    }
    
    func connect(input: HomeViewModelInput) -> HomeViewModelOutput {
        input
            .proceedButtonTap
            .sink(receiveValue: action.pushToCollection)
            .store(in: &cancellables)
            
        input
            .aboutButtonTap
            .sink(receiveValue: action.pushToAboutPage)
            .store(in: &cancellables)
                
        return HomeViewModelOutput(useCase.fetch())
    }

    deinit {
        print("HomeViewModel deinit")
    }
    
}
