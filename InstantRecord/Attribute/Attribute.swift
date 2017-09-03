//
//  Attribute.swift
//  InstantRecord
//
//  Created by Patrick on 27/08/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//


/** Represents an attribute, for filtering or sorting purposes */
class Attribute {

    /// Name of the attribute
    let name: String

    /** Initializer */
    init(_ name: String) {
        self.name = name
    }

    /** Equal operator */
    static func == (attribute: Attribute, value: Any?) -> Where {
        return WhereCondition(with: attribute, value: value, operator: .equal)
    }

    /** Not equal operator */
    static func != (attribute: Attribute, value: Any?) -> Where {
        return WhereCondition(with: attribute, value: value, operator: .notEqual)
    }

}

