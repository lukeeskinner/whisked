//
//  Matcha.swift
//  whisked
//
//  Created by Luke Skinner on 2/12/26.
//

import SwiftUI

class Matcha {
    var id: Int
    var brand: String
    var title: String
    var type: MatchaType
    
    init(id: Int, brand: String, title: String, type: MatchaType) {
        self.id = id
        self.brand = brand
        self.title = title
        self.type = type
    }
}

