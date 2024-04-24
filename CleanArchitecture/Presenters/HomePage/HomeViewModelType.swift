//
//  HomeViewModelType.swift
//  CleanArchitecture
//
//  Created by myung hoon on 21/04/2024.
//

import Combine

struct HomeViewModelInput {
    let proceedButtonTap: AnyPublisher<Void, Never>
    let aboutButtonTap: AnyPublisher<Void, Never>
}

typealias HomeViewModelOutput = AnyPublisher<String, Never>

struct HomeViewModelAction {
    let pushToCollection: () -> Void
    let pushToAboutPage: () -> Void
}

protocol HomeViewModelType {
    func connect(input: HomeViewModelInput) -> HomeViewModelOutput
}
