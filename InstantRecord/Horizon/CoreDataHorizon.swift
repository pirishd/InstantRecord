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


    /** Returns the number of records for the provided Entity */
    func count<T: InstantRecordable>(_ type: T.Type) -> Int {
        let searchable = self.searchable(from: T.self)
        return searchable.mr_numberOfEntities(with: self.context).intValue
    }


    /** Returns the number of records for the provided Entity matching given criteria */
    func count<T: InstantRecordable>(_ type: T.Type, where criteria: Where) -> Int {
        let searchable = self.searchable(from: T.self)
        return searchable.mr_numberOfEntities(with: criteria.predicate, in: self.context).intValue
    }


    /** Returns all the records of the provided Entity */
    func all<T: InstantRecordable>(_ type: T.Type) -> [T] {
        let searchable = self.searchable(from: T.self)
        let found = searchable.mr_findAll(in: self.context)
        return self.managedObjects(found, to: T.self)
    }


    /** Returns all the records of the provided Entity sorted by provided Order */
    func all<T: InstantRecordable>(_ type: T.Type, sortedBy order: Order) -> [T] {
        let searchable = self.searchable(from: T.self)
        let attribute = self.orderFormatter.format(order)

        let found = searchable.mr_findAllSorted(by: attribute, ascending: true, in: self.context)
        return self.managedObjects(found, to: T.self)
    }


    /** Convert a list of `NSManagedObject` to array of given type */
    private func managedObjects<T: InstantRecordable>(_ objects: [NSManagedObject]?, to type: T.Type) -> [T] {
        let ret = objects?.map({ (obj) -> T? in obj as? T }).flatMap { $0 }
        return ret ?? [T]()
    }

}
