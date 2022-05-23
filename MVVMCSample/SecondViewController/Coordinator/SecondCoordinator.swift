//
//  SecondCoordinator.swift
//  MVVMCSample
//
//  Created by Ines Sakly on 6/4/2022.
//

import Foundation
import UIKit
protocol BackToFirstViewControllerDelegate: class {
    
    func navigateBackToFirstPage(coordinator: SecondCoordinator)
}

class SecondCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    let secondViewModel: SecondViewmodel = SecondViewmodel()
    unowned let navigationController:UINavigationController
    
    weak var delegate: BackToFirstViewControllerDelegate?
    /// init navigationController
    /// - Parameter navigationController: navigationController
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    /// start navigation
    func start() {
        let secondViewController : SecondViewController = SecondViewController()
        secondViewController.delegate = self
        secondViewController.secondViewModel = secondViewModel
        self.navigationController.pushViewController(secondViewController, animated: true)
    }
}

extension SecondCoordinator : SecondViewControllerDelegate {
    
    /// Navigate to third page
    func navigateToThirdPage() {
        let thirdViewController : ThirdViewController = ThirdViewController()
        thirdViewController.delegate = self
        self.navigationController.pushViewController(thirdViewController, animated: true)
    }
    
    /// Navigate to first page
    func navigateToFirstPage() {
        self.delegate?.navigateBackToFirstPage(coordinator: self)
    }
}
