//
//  CoreDataEngineTests.swift
//  InstantRecord
//
//  Created by Patrick on 27/08/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//

import XCTest
import MagicalRecord
@testable import InstantRecord

class CoreDataEngineTests: InstantRecordTestCase {

    private var engine: CoreDataEngine!


    override func setUp() {
        super.setUp()
        self.engine = CoreDataEngine()
    }


    func testCreateHorizon() {
        let horizon1 = self.engine.createHorizon() as! CoreDataHorizon
        let horizon2 = self.engine.createHorizon() as! CoreDataHorizon
        XCTAssertTrue(horizon1 !== horizon2)
    }


    func testCurrentHorizon_mainThread() {
        let horizon1 = self.engine.currentHorizon as! CoreDataHorizon
        let horizon2 = self.engine.currentHorizon as! CoreDataHorizon
        XCTAssertTrue(horizon1 === horizon2)
    }


    func testCurrentHorizon_otherThread() {

        let horizon1 = self.engine.currentHorizon as! CoreDataHorizon
        var horizon2: CoreDataHorizon?
        var horizon3: CoreDataHorizon?

        let thread = Thread {
            horizon2 = self.engine.currentHorizon as? CoreDataHorizon
            horizon3 = self.engine.currentHorizon as? CoreDataHorizon
            Thread.exit()
        }

        thread.start()

        XCTAssertTrue(horizon1 !== horizon2)
        XCTAssertTrue(horizon2 === horizon3)
    }

}
