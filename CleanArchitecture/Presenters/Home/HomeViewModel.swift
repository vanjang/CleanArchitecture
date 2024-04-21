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
    
    init(action: HomeViewModelAction) {
        self.action = action
    }
    
    func connect(input: HomeViewModelInput) -> HomeViewModelOutput {
        input
            .sink(receiveValue: action.pushToCollection)
            .store(in: &cancellables)
            
        return HomeViewModelOutput(Just("frans_hals"))
    }

    deinit {
        print("HomeViewModel deinit")
    }
    
}
