//
//  InstantRecordTests.swift
//  InstantRecordTests
//
//  Created by Patrick on 26/08/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//

import XCTest
@testable import InstantRecord

class InstantRecordTests: XCTestCase {
    

    func testInstance() {

        InstantRecord.setUp(with: CoreDataEngine())
        let instance = InstantRecord.instance
        let instance2 = InstantRecord.instance

        XCTAssertTrue(instance === instance2)
    }

}
