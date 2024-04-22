//
//  AppDependencyContainer.swift
//  CleanArchitecture
//
//  Created by myung hoon on 22/04/2024.
//

import Foundation

struct AppDependencyContainer {
    func makeAppDependenciesContainer() -> DependenciesContainer {
        let dependencies = DependenciesContainer.Dependencies(localDataTransferService: LocalDataTransferService(localDataService: LocalDataService()),
                                                              apiDataTransferService: CollectionDataTransferService(networkService: NetworkService()))
        return DependenciesContainer(dependencies: dependencies)
    }
}
