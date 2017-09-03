//
//  CoreDataOrderFormatter.swift
//  InstantRecord
//
//  Created by Patrick on 02/09/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//


/** Helper for formatting order for CoreData */
class CoreDataOrderFormatter {


    /** Get string for given order */
    func format(_ order: Order) -> String {

        // current order
        var ret = order.attribute.name
        if !order.ascending {
            ret += ":NO"
        }

        // handle next order if any
        if let nextOrder = order.nextOrder {
            return ret + "," + self.format(nextOrder)
        }

        return ret
    }

}
