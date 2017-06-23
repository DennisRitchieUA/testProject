//
//  User+CoreDataProperties.swift
//  testProject
//
//  Created by Dennis Ritchie on 23.06.17.
//  Copyright © 2017 v-jet. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var avatar: URL?
    @NSManaged public var token: String?
    @NSManaged public var creation_time: NSDate?

}
