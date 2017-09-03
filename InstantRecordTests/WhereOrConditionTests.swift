//
//  WhereOrConditionTests.swift
//  InstantRecord
//
//  Created by Patrick on 03/09/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//

import XCTest
@testable import InstantRecord


class WhereOrConditionTests: XCTest {

    func testPredicateStr_several() {
        let where1 = WhereCondition(with: Attribute("name"), value: "toto", operator: .equal)
        let where2 = WhereCondition(with: Attribute("age"), value: 32, operator: .notEqual)

        let where3 = WhereOrCondition(where1, where2)
        XCTAssertEqual(where3.predicateStr, "(name == \"toto\" || age != 32)")
    }

}
