//
//  AppCoordinator.swift
//  CleanArchitecture
//
//  Created by myung hoon on 21/04/2024.
//

import UIKit

struct AppCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private let appDependencies: AppDependencyContainer
    
    init(navigationController: UINavigationController, dependencies: AppDependencyContainer) {
        self.navigationController = navigationController
        self.appDependencies = dependencies
    }
    
    func start() {
        let appDependencyContainer = appDependencies.makeAppDependenciesContainer()
        let flow = appDependencyContainer.makeHomeViewCoordinator(navigationController: navigationController)
        flow.start()
    }
}
