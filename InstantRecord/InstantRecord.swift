//
//  InstantRecord.swift
//  InstantRecord
//
//  Created by Patrick on 26/08/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//


/**
    This class is the entry point for using InstantRecord. It aims at registrating which
    database engine to use, and providing useful objects for manipulating storage
 
    Example of registration:

        InstantRecord.setUp(with: CoreDataEngine())
 
    Example of usage:

        let instantRecord = InstantRecord.instance
 
    Example for mocking
 
        let instantRecord = InstantRecord.instanceMock
 */
public class InstantRecord {

    /// Engine used
    let engine: Engine

    /// Actual private instance
    private static var _instance: InstantRecord?

    /// Exposed instance
    static var instance: InstantRecord {

        // make sure set up was properly done
        guard let instance = _instance else {
            fatalError("InstantRecord was not set up, use InstantRecord.setUp(…)")
        }
        return instance
    }


    ///
    /// Initializer
    /// - parameter engine: engine used for all database operations
    ///
    private init(with engine: Engine) {
        self.engine = engine
    }


    ///
    /// Set up the library with database engine
    /// - parameter engine: engine used for all database operations
    ///
    static func setUp(with engine: Engine) {
        if _instance != nil {
            fatalError("InstantRecord was already set up")
        }
        _instance = InstantRecord(with: engine)
    }

}
