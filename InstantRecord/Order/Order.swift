//
//  Order.swift
//  InstantRecord
//
//  Created by Patrick on 27/08/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//


/**
    Order for fetching data

    Example:
        let orderBy = Order(by: Attribute("name")).then(by: Attribute("age"), ascending: false)
 */
class Order {

    /// Attribute to order by
    let attribute: Attribute

    /// Flag that indicates the order is ascending or descending
    let ascending: Bool

    /// Next order to apply order by, as orders can be chained
    var nextOrder: Order?


    /** Initializer */
    init(by attribute: Attribute, ascending: Bool = true) {
        self.attribute = attribute
        self.ascending = ascending
    }


    /** Chaining orders */
    func then(by attribute: Attribute, ascending: Bool = true) -> Order {
        self.nextOrder = Order(by: attribute, ascending: ascending)
        return self
    }

}
