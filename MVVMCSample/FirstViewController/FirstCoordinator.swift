//
//  FirstCoordinator.swift
//  MVVMCSample
//
//  Created by Ines Sakly on 5/4/2022.
//

import Foundation
import UIKit

import UIKit

class FirstCoordinator: Coordinator {
    /// childs for existing coordinators
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController:UINavigationController
    /// init navigationController
    /// - Parameter navigationController: navigationController
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    /// start navigation
    func start() {
        let firstViewController : FirstViewController = FirstViewController()
        firstViewController.delegate = self
        self.navigationController.pushViewController(firstViewController, animated: true)
    }
}

extension FirstCoordinator: FirstViewControllerDelegate {

    /// Navigate to next page
    func navigateToNextPage() {
       let secondCoordinator = SecondCoordinator(navigationController: navigationController)
       secondCoordinator.delegate = self
       childCoordinators.append(secondCoordinator)
       secondCoordinator.start()
    }
}

extension FirstCoordinator: BackToFirstViewControllerDelegate {
    
    /// Back from First page
    func navigateBackToFirstPage(coordinator: SecondCoordinator) {
        navigationController.popToRootViewController(animated: true)
        childCoordinators.removeLast()
    }
}
