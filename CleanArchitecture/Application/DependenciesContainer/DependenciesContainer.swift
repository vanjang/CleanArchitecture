//
//  DependenciesContainer.swift
//  CleanArchitecture
//
//  Created by myung hoon on 21/04/2024.
//

import UIKit

struct DependenciesContainer {
    struct Dependencies {
        // to be implemented
    }
}

// MARK: - Home View Dependencies container
extension DependenciesContainer {
    // MARK: - Use Cases
    func makeHomeViewUseCase() -> HomeViewUseCaseType {
        HomeViewUseCase(repository: makeHomeViewRepository())
    }
    
    // MARK: - Repository
    func makeHomeViewRepository() -> HomeViewRepositoryType {
        HomeViewRepository()
    }
    
    // MARK: - View Model
    func makeHomeViewViewModel(action: HomeViewModelAction) -> HomeViewModelType {
        HomeViewModel(useCase: makeHomeViewUseCase(), action: action)
    }
    
    // MARK: - Controllers
    func makeHomeViewController(action: HomeViewModelAction) -> UIViewController {
        HomeViewController(viewModel: makeHomeViewViewModel(action: action))
    }
    
    // MARK: - Flow Coordinators
    func makeHomeViewCoordinator(navigationController: UINavigationController) -> Coordinator {
        HomeViewCoordinator(navigationController: navigationController, dependencies: self)
    }
}
