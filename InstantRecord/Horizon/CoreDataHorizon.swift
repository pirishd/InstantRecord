//
//  CoreDataHorizon.swift
//  InstantRecord
//
//  Created by Patrick on 27/08/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//

import MagicalRecord


/** CoreData implementation of a horizon */
class CoreDataHorizon: Horizon {

    /// CoreData context on which performing database operations
    fileprivate let context: NSManagedObjectContext


    /** Initialize with thread context */
    init(with context: NSManagedObjectContext) {
        self.context = context
    }

}


/** Finders */
extension CoreDataHorizon {

    /// Finds the first record on the provided Entity
    func first<T: InstantRecordable>(_ type: T.Type) -> T? {

        // make sure type is a `NSManagedObject£
        guard let searchable = T.self as? NSManagedObject.Type else {
            fatalError("\(T.self) is not a NSManagedObject type")
        }

        // find first object
        if let ret = searchable.mr_findFirst(in: self.context) as? T {
            return ret
        }

        // default nil value
        return nil
    }

}
