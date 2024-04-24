//
//  HomeViewCoordinator.swift
//  CleanArchitecture
//
//  Created by myung hoon on 21/04/2024.
//

import UIKit

struct HomeViewCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private let dependencies: DependenciesContainer
    
    init(navigationController: UINavigationController, dependencies: DependenciesContainer) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let homeViewAction = HomeViewModelAction(pushToCollection: pushToCollection, pushToAboutPage: pushToAboutPage)
        let vc = dependencies.makeHomeViewController(action: homeViewAction)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pushToCollection() {
        navigationController.pushViewController(dependencies.makeCollectionPageViewController(), animated: true)
    }
    
    func pushToAboutPage() {
        print("pushToAboutPage")
    }
}
