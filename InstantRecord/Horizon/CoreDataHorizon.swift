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

    /// Helper for formatting orders
    fileprivate let orderFormatter = CoreDataOrderFormatter()

    /** Initialize with thread context */
    init(with context: NSManagedObjectContext) {
        self.context = context
    }

}


/** Finders */
extension CoreDataHorizon {


    /** Returns a `NSManagedObject` searchable type */
    private func searchable<T: InstantRecordable>(from type: T.Type) -> NSManagedObject.Type {
        guard let searchable = T.self as? NSManagedObject.Type else {
            fatalError("\(T.self) is not a NSManagedObject type")
        }
        return searchable
    }


    /** Finds the first record on the provided Entity */
    func first<T: InstantRecordable>(_ type: T.Type) -> T? {
        var ret: T?

        // find first object
        let searchable = self.searchable(from: T.self)
        if let first = searchable.mr_findFirst(in: self.context) as? T {
            ret = first
        }

        return ret
    }


    /** Finds the first record on the provided Entity, sorted by provided Order */
    func first<T: InstantRecordable>(_ type: T.Type, sortedBy order: Order) -> T? {
        var ret: T?

        // find sorted first object
        let searchable = self.searchable(from: T.self)
        let attribute = self.orderFormatter.format(order)
        if let first = searchable.mr_findFirstOrdered(byAttribute: attribute, ascending: true, in: self.context) as? T {
            ret = first
        }

        return ret
    }


    /** Finds the first record on the provided Entity, matching given criteria */
    func first<T: InstantRecordable>(_ type: T.Type, where criteria: Where) -> T? {
        var ret: T?

        // find filtered first object
        let searchable = self.searchable(from: T.self)
        if let first = searchable.mr_findFirst(with: criteria.predicate, in: self.context) as? T {
            ret = first
        }

        return ret
    }


    /** Finds the first record on the provided Entity, matching given criteria, sorted by provided Order */
    func first<T: InstantRecordable>(_ type: T.Type, where criteria: Where, sortedBy order: Order) -> T? {
        var ret: T?

        // find sorted, filtered first object
        let searchable = self.searchable(from: T.self)
        let sortedBy = self.orderFormatter.format(order)
        let predicate = criteria.predicate
        if let first = searchable.mr_findFirst(with: predicate, sortedBy: sortedBy, ascending: true, in: self.context) as? T {
            ret = first
        }

        return ret
    }

}
