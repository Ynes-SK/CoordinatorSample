//
//  SecondViewController.swift
//  MVVMCSample
//
//  Created by Ines Sakly on 5/4/2022.
//

import Foundation
import UIKit
public protocol SecondViewControllerDelegate: class {
    func navigateToFirstPage()
    func navigateToThirdPage()
}
class SecondViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
     weak var delegate: SecondViewControllerDelegate?
     var secondViewModel: SecondViewmodel?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        title = "SecondViewController"
        secondViewModel?.loadData(completion: {
            self.tableView.reloadData()
        })
    }
}
extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secondViewModel?.users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: "UserCell"))!
        cell.textLabel?.text = secondViewModel?.users?[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.navigateToThirdPage()
    }
}
