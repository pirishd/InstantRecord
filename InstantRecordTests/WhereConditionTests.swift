//
//  WhereConditionTests.swift
//  InstantRecord
//
//  Created by Patrick on 03/09/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//

import XCTest
@testable import InstantRecord


class WhereConditionTests: XCTest {


    func testPredicateStr_equal() {
        let whereAtt = WhereCondition(with: Attribute("name"), value: "toto", operator: .equal)
        XCTAssertEqual(whereAtt.predicateStr, "name == \"toto\"")
    }


    func testPredicateStr_notEqual() {
        let whereAtt = WhereCondition(with: Attribute("name"), value: "toto", operator: .notEqual)
        XCTAssertEqual(whereAtt.predicateStr, "name != \"toto\"")
    }


    func testPredicateStr_nil() {
        let whereAtt = WhereCondition(with: Attribute("name"), value: nil, operator: .notEqual)
        XCTAssertEqual(whereAtt.predicateStr, "name != \"toto\"")
    }

}
