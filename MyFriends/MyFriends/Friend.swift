//
//  Friend.swift
//  MyFriends
//
//  Created by Mangdi on 2022/10/17.
//

import Foundation

struct Friend: Codable {
    struct Address: Codable {
        let country: String
        let city: String
    }
    
    let name: String
    let age: Int
    let addressInfo: Address
    
    var nameAndAge: String {
        return name + "\(age)"
    }
    
    var fullAddress: String {
        return addressInfo.city + ", " + addressInfo.country
    }
    
    enum CodingKeys: String, CodingKey {
        case name, age
        case addressInfo = "address_info"
    }
}
