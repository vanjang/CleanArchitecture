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
    // to be implemented
    
    // MARK: - Repository
    // to be implemented
    
    // MARK: - View Model
    func makeHomeViewViewModel(action: HomeViewModelAction) -> HomeViewModelType {
        HomeViewModel(action: action)
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
