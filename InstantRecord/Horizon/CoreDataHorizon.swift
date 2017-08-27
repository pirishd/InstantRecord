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
    private let context: NSManagedObjectContext


    /** Initialize with thread context */
    init(with context: NSManagedObjectContext) {
        self.context = context
    }

}
