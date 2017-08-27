//
//  Engine.swift
//  InstantRecord
//
//  Created by Patrick on 26/08/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//


/** Database engine that aims at providing horizons (basically, database contexts) */
protocol Engine {
    var currentHorizon: Horizon { get }
    func createHorizon() -> Horizon
}
