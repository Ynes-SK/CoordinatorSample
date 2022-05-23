//
//  Coordinator.swift
//  MVVMCSample
//
//  Created by Ines Sakly on 5/4/2022.
//
import UIKit

public protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }

    // All coordinators will be initilised with a navigation controller
    init(navigationController:UINavigationController)
    
    //start a navigation
    func start()
    
}
