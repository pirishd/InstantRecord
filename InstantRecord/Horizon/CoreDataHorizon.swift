//
//  CoreDataHorizon.swift
//  InstantRecord
//
//  Created by Patrick on 27/08/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//

import MagicalRecord

class CoreDataHorizon: Horizon {

    private let context: NSManagedObjectContext

    init(with context: NSManagedObjectContext) {
        self.context = context
    }

}
