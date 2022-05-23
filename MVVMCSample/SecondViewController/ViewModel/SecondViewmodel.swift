//
//  SecondViewmodel.swift
//  MVVMCSample
//
//  Created by Ines Sakly on 7/4/2022.
//

import Foundation
import NetworkingManager

class SecondViewmodel {
    var users: [User]?
    func loadData(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://60c86ffcafc88600179f70e2.mockapi.io/api/getRequest") else { fatalError("Invalid URL") }

        NetworkingManager().request(fromURL: url, httpMethod: .get) { (result: Result<[User], Error>) in
            switch result {
            case .success(let users):
                debugPrint("successful result with \(users.count) users.")
                 self.users = users
                 completion()
            case .failure(let error):
                debugPrint("failure trying to get the users: \(error.localizedDescription)")
        }
        }
    }
    
}
