//
//  HomeViewRepository.swift
//  CleanArchitecture
//
//  Created by myung hoon on 21/04/2024.
//

import Combine

protocol HomeViewRepositoryType {
    func fetchHomeImageString() -> AnyPublisher<String, Never>
}
