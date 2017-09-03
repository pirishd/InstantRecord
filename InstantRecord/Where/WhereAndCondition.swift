//
//  WhereAndCondition.swift
//  InstantRecord
//
//  Created by Patrick on 03/09/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//


/** Represents a AND condition between two Where conditions */
class WhereAndCondition: Where {

    private let where1: Where
    private let where2: Where


    /// Predicate string representing the clause
    override var predicateStr: String {
        return "(\(self.where1.predicateStr) && \(self.where2.predicateStr))"
    }


    /** Initializer */
    init(_ where1: Where, _ where2: Where) {
        self.where1 = where1
        self.where2 = where2
    }

}

