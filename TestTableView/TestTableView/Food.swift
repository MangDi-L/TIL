//
//  Food.swift
//  TestTableView
//
//  Created by Mangdi on 2022/10/22.
//

import Foundation

enum FoodType: Int {
    case American
    case Chinese
    case Korean
    case Japanese
    
    var sectionName: String {
        switch self {
        case .American:
            return "양식"
        case .Chinese:
            return "중식"
        case .Korean:
            return "한식"
        case .Japanese:
            return "일식"
        }
    }
}

struct Food {
    let name: String
    var price: Int
}
