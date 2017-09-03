//
//  Where.swift
//  InstantRecord
//
//  Created by Patrick on 03/09/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//


/** Abstract class representing some criteria to be applied when searching for entities */
class Where {

    /// Predicate representing the clause to be applied
    var predicate: NSPredicate {
        return NSPredicate(format: self.predicateStr)
    }

    /// Predicate string, must be overriden
    var predicateStr: String {
        fatalError("Virtual property, must be overriden in subclasses")
    }


    /** And operator */
    static func && (where1: Where, where2: Where) -> Where {
        return WhereAndCondition(where1, where2)
    }


    /** Or operator */
    static func || (where1: Where, where2: Where) -> Where {
        return WhereOrCondition(where1, where2)
    }

}
