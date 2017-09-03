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


    func testFirstSortedBy() {
        let order = Order(by: Attribute("name"))

        var foundEntity = self.horizon.first(EntityTest.self, sortedBy: order)
        XCTAssertNil(foundEntity)

        let entity1 = EntityTest.mr_createEntity(in: self.context)
        entity1?.name = "bbb"

        foundEntity = self.horizon.first(EntityTest.self, sortedBy: order)
        XCTAssertTrue(entity1 === foundEntity)

        let entity2 = EntityTest.mr_createEntity(in: self.context)
        entity2?.name = "aaa"

        foundEntity = self.horizon.first(EntityTest.self, sortedBy: order)
        XCTAssertTrue(entity2 === foundEntity)
    }


    func testFirstSortedBy_severalCriteria() {
        let order = Order(by: Attribute("name")).then(by: Attribute("age"), ascending: false)

        var foundEntity = self.horizon.first(EntityTest.self, sortedBy: order)
        XCTAssertNil(foundEntity)

        let entity1 = EntityTest.mr_createEntity(in: self.context)
        entity1?.name = "bbb"
        entity1?.age = 12

        let entity2 = EntityTest.mr_createEntity(in: self.context)
        entity2?.name = "ccc"
        entity2?.age = 23

        let entity3 = EntityTest.mr_createEntity(in: self.context)
        entity3?.name = "aaa"
        entity3?.age = 60

        let entity4 = EntityTest.mr_createEntity(in: self.context)
        entity4?.name = "ddd"
        entity4?.age = 44

        foundEntity = self.horizon.first(EntityTest.self, sortedBy: order)
        XCTAssertTrue(entity3 === foundEntity)
    }


    func testFirstWhere() {
        let criteria = Attribute("name") == "aaa" && Attribute("age") != 32

        var foundEntity = self.horizon.first(EntityTest.self, where: criteria)
        XCTAssertNil(foundEntity)

        let entity1 = EntityTest.mr_createEntity(in: self.context)
        entity1?.name = "bbb"
        entity1?.age = 32

        let entity2 = EntityTest.mr_createEntity(in: self.context)
        entity2?.name = "aaa"
        entity2?.age = 23

        foundEntity = self.horizon.first(EntityTest.self, where: criteria)
        XCTAssertTrue(entity2 === foundEntity)
    }


    func testFirstWhereSortedBy() {
        let criteria = Attribute("name") == "aaa"
        let order = Order(by: Attribute("age"))

        var foundEntity = self.horizon.first(EntityTest.self, where: criteria, sortedBy: order)
        XCTAssertNil(foundEntity)

        let entity1 = EntityTest.mr_createEntity(in: self.context)
        entity1?.name = "aaa"
        entity1?.age = 32

        let entity2 = EntityTest.mr_createEntity(in: self.context)
        entity2?.name = "aaa"
        entity2?.age = 23

        foundEntity = self.horizon.first(EntityTest.self, where: criteria, sortedBy: order)
        XCTAssertTrue(entity2 === foundEntity)
    }

}
