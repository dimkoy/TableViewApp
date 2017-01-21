//
//  Restaurant.swift
//  tableViewApplication
//
//  Created by Dmitriy on 21/01/2017.
//  Copyright © 2017 Dmitriy. All rights reserved.
//

import Foundation

class Restaurant {
    var name: String
    var type: String
    var image: String
    var location: String
    var isVisited: Bool
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.image = image
        self.location = location
        self.isVisited = isVisited
    }
}
