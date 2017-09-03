//
//  WhereCondition.swift
//  InstantRecord
//
//  Created by Patrick on 03/09/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//


/// Operators used on Where clauses
enum WhereOperator: String {
    case equal = "=="
    case notEqual = "!="
}


/** Where condition to be applied */
class WhereCondition: Where {

    /// Attribute to apply clause on
    private let attribute: Attribute

    /// Value to be verified
    private let value: Any?

    /// Operator to be applied
    private let whereOperator: WhereOperator

    /// Predicate string representing the clause
    override var predicateStr: String {
        var value = self.value

        // special case for strings, add double quotes
        if let valueStr = value as? String {
            value = "\"" + valueStr + "\""
        }

        return "\(self.attribute.name) \(self.whereOperator.rawValue) \(value ?? "nil")"
    }


    /** Initializer */
    init(with attribute: Attribute, value: Any?, operator whereOperator: WhereOperator) {
        self.attribute = attribute
        self.value = value
        self.whereOperator = whereOperator
    }

}
