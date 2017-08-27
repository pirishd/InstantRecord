//
//  CoreDataHorizonTests.swift
//  InstantRecord
//
//  Created by Patrick on 27/08/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//

import XCTest
@testable import InstantRecord


class CoreDataHorizonTests: InstantRecordTestCase {

    private var horizon: CoreDataHorizon!


    override func setUp() {
        super.setUp()
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
