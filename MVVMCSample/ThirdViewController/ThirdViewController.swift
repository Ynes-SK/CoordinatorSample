//
//  ThirdViewController.swift
//  MVVMCSample
//
//  Created by Ines Sakly on 5/4/2022.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    public weak var delegate: SecondViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    @IBAction func BackToFirstView(_ sender: Any) {
        self.delegate?.navigateToFirstPage()
    }
    
}
