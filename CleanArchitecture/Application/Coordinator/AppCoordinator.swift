//
//  AppCoordinator.swift
//  CleanArchitecture
//
//  Created by myung hoon on 21/04/2024.
//

import UIKit

struct AppCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private let dependencies: DependenciesContainer
    
    init(navigationController: UINavigationController, dependencies: DependenciesContainer) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let flow = dependencies.makeHomeViewCoordinator(navigationController: navigationController)
        flow.start()
    }
}
