//
//  EntityTest.swift
//  InstantRecord
//
//  Created by Patrick on 27/08/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//

import Foundation
import CoreData
@testable import InstantRecord


/// Test entity
@objc(EntityTest)
public class EntityTest: NSManagedObject, InstantRecordable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntityTest> {
        return NSFetchRequest<EntityTest>(entityName: "EntityTest")
    }

}
