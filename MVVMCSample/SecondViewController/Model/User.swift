//
//  User.swift
//  MVVMCSample
//
//  Created by Ines Sakly on 7/4/2022.
//

struct User: Codable, Identifiable {
    var id: String
    var createdAt: String
    var name: String
    var avatar: String
    enum CodingKeys: CodingKey {
        case id
        case createdAt
        case name
        case avatar
    }
}
