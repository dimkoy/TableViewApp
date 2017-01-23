//
//  Restaurant.swift
//  tableViewApplication
//
//  Created by Dmitriy on 21/01/2017.
//  Copyright © 2017 Dmitriy. All rights reserved.
//

import Foundation
import CoreData

class Restaurant: NSManagedObject {
    
    @NSManaged var name: String!
    @NSManaged var type: String!
    @NSManaged var image: NSData!
    @NSManaged var location: String!
    @NSManaged var isVisited: NSNumber!
   
}
