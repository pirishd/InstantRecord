//
//  InstantRecordTestCase.swift
//  InstantRecord
//
//  Created by Patrick on 27/08/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//

import XCTest
import MagicalRecord


class InstantRecordTestCase: XCTestCase {

    /// context to use
    var context: NSManagedObjectContext!

    override func setUp() {
        super.setUp()

        // add entity dynamically
        let model = NSManagedObjectModel()
        let entityDesc = NSEntityDescription()
        entityDesc.name = "EntityTest"
        entityDesc.managedObjectClassName = "EntityTest"
        model.entities = [entityDesc]

        // in-memory store
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        _  = try? persistentStoreCoordinator.addPersistentStore(
            ofType: NSInMemoryStoreType,
            configurationName: nil,
            at: nil,
            options: nil
        )

        // set model to context
        NSManagedObjectContext.mr_initializeDefaultContext(with: persistentStoreCoordinator)

        // set context
        self.context = NSManagedObjectContext.mr_default()
    }

}
