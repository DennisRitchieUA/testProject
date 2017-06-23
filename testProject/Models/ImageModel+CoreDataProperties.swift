//
//  ImageModel+CoreDataProperties.swift
//  testProject
//
//  Created by Dennis Ritchie on 23.06.17.
//  Copyright © 2017 v-jet. All rights reserved.
//

import Foundation
import CoreData


extension ImageModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageModel> {
        return NSFetchRequest<ImageModel>(entityName: "ImageModel")
    }

    @NSManaged public var bigImage: URL?
    @NSManaged public var smallImage: URL?
    @NSManaged public var address: String?
    @NSManaged public var weather: String?

}
