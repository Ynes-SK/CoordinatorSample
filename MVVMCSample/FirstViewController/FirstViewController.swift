//
//  FirstViewController.swift
//  MVVMCSample
//
//  Created by Ines Sakly on 30/3/2022.
//

import UIKit
public protocol FirstViewControllerDelegate: class {
    func navigateToNextPage()
}
class FirstViewController: UIViewController {
    public weak var delegate: FirstViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FirstViewController"
    }
    @IBAction func goSecondView(_ sender: Any) {
        self.delegate?.navigateToNextPage()
    }
    
}

