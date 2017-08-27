//
//  CoreDataHorizonTests.swift
//  InstantRecord
//
//  Created by Patrick on 27/08/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//

import XCTest
import MagicalRecord
@testable import InstantRecord


class CoreDataHorizonTests: XCTestCase {

    private var horizon: CoreDataHorizon!
    private var context: NSManagedObjectContext!


    override func setUp() {
        super.setUp()

        let model = NSManagedObjectModel()
        let entityDesc = NSEntityDescription()
        entityDesc.name = "EntityTest"
        entityDesc.managedObjectClassName = "EntityTest"
        model.entities = [entityDesc]

        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        _  = try? persistentStoreCoordinator.addPersistentStore(
            ofType: NSInMemoryStoreType,
            configurationName: nil,
            at: nil,
            options: nil
        )

        NSManagedObjectContext.mr_initializeDefaultContext(with: persistentStoreCoordinator)

        self.context = NSManagedObjectContext.mr_default()
        self.horizon = CoreDataHorizon(with: self.context)
    }


    func testFirst() {
        var foundEntity = self.horizon.first(EntityTest.self)
        XCTAssertNil(foundEntity)

        let entity = EntityTest.mr_createEntity(in: self.context)
        foundEntity = self.horizon.first(EntityTest.self)
        XCTAssertTrue(entity === foundEntity)
    }

}
