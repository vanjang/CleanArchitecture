//
//  HomeViewModelType.swift
//  CleanArchitecture
//
//  Created by myung hoon on 21/04/2024.
//

import Combine

typealias HomeViewModelInput = AnyPublisher<Void, Never>
typealias HomeViewModelOutput = AnyPublisher<String, Never>

struct HomeViewModelAction {
    let pushToCollection: () -> Void
}

protocol HomeViewModelType {
    func connect(input: HomeViewModelInput) -> HomeViewModelOutput
}
