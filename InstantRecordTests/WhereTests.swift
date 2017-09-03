//
//  WhereTests.swift
//  InstantRecord
//
//  Created by Patrick on 03/09/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//


import XCTest
@testable import InstantRecord


class WhereTests: InstantRecordTestCase {

    func testPredicateStr_chainingComplex() {
        let where1 = WhereCondition(with: Attribute("name"), value: "toto", operator: .equal)
        let where2 = WhereCondition(with: Attribute("age"), value: 32, operator: .notEqual)
        let where3 = WhereCondition(with: Attribute("other"), value: "azerty", operator: .equal)

        var whereRes = (where1 && where2) || where3
        XCTAssertEqual(whereRes.predicateStr, "((name == \"toto\" && age != 32) || other == \"azerty\")")

        whereRes = where1 && (where2 || where3)
        XCTAssertEqual(whereRes.predicateStr, "(name == \"toto\" && (age != 32 || other == \"azerty\"))")
    }

}
