//
//  Horizon.swift
//  InstantRecord
//
//  Created by Patrick on 27/08/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//


/**
    Database horizon, which is a scope defined for accessing the database.
    It enables to perform searches, create, update and delete operations.
    It is bound to a thread, and cannot be used in a different thread than
    the one it was created on (like `NSManagedObjectContext` in CoreData)
 */
protocol Horizon {

    /// Finds the first record of the provided Entity
    func first<T: InstantRecordable>(_ type: T.Type) -> T?

    /// Finds the first record of the provided Entity sorted by provided order
    func first<T: InstantRecordable>(_ type: T.Type, sortedBy: Order) -> T?

    /// Finds the first record of the provided Entity matching given criteria
    func first<T: InstantRecordable>(_ type: T.Type, where: Where) -> T?

    /// Finds the first record of the provided Entity matching given criteria, sorted by provided order
    func first<T: InstantRecordable>(_ type: T.Type, where: Where, sortedBy: Order) -> T?

    /// Returns the number of records for the provided Entity
    func count<T: InstantRecordable>(_ type: T.Type) -> Int

    /// Returns the number of records for the provided Entity matching given criteria
    func count<T: InstantRecordable>(_ type: T.Type, where: Where) -> Int

    /// Finds all the records of the provided Entity
    func all<T: InstantRecordable>(_ type: T.Type) -> [T]

    /// Finds all the records of the provided Entity sorted by provided order
    func all<T: InstantRecordable>(_ type: T.Type, sortedBy: Order) -> [T]

}
