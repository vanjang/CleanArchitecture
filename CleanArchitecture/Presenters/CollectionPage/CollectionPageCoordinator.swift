//
//  CollectionPageCoordinator.swift
//  CleanArchitecture
//
//  Created by myung hoon on 24/04/2024.
//

import UIKit

struct CollectionPageCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private let dependencies: DependenciesContainer
    
    init(navigationController: UINavigationController, dependencies: DependenciesContainer) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let vc = dependencies.makeCollectionPageViewController()
        navigationController.pushViewController(vc, animated: true)
    }
}
