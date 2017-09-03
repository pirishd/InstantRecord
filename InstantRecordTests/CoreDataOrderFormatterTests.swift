//
//  CoreDataOrderFormatterTests.swift
//  InstantRecord
//
//  Created by Patrick on 02/09/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//

import XCTest
@testable import InstantRecord


class CoreDataOrderFormatterTests: InstantRecordTestCase {


    func testStringForOrder_simple() {
        let order = Order(by: Attribute("toto"))
        let str = CoreDataOrderFormatter().format(order)
        XCTAssertEqual(str, "toto")
    }

    func testStringForOrder_simple_desc() {
        let order = Order(by: Attribute("toto"), ascending: false)
        let str = CoreDataOrderFormatter().format(order)
        XCTAssertEqual(str, "toto:NO")
    }

    func testStringForOrder_several() {
        let order = Order(by: Attribute("toto")).then(by: Attribute("tata"), ascending: false)
        let str = CoreDataOrderFormatter().format(order)
        XCTAssertEqual(str, "toto,tata:NO")
    }

}
