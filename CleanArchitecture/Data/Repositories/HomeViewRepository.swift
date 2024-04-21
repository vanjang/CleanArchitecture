//
//  HomeViewRepository.swift
//  CleanArchitecture
//
//  Created by myung hoon on 21/04/2024.
//

import Foundation
import Combine

final class HomeViewRepository: HomeViewRepositoryType {
    func fetchHomeImageString() -> AnyPublisher<String, Never> {
        var defaultImageString = "frans_hals"
        if let infoDict = Bundle.main.infoDictionary {
            if let value = infoDict["Home View Image String"] as? String {
                defaultImageString = value
            }
        }
        return Just(defaultImageString).eraseToAnyPublisher()
    }
}
