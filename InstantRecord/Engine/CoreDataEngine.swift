//
//  CoreDataEngine.swift
//  InstantRecord
//
//  Created by Patrick on 26/08/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//

import MagicalRecord


/** CoreData implementation of an engine */
class CoreDataEngine: Engine {

    /// Default horizon
    private lazy var defaultHorizon: Horizon = {
        return CoreDataHorizon(with: NSManagedObjectContext.mr_default())
    }()


    /// List of managed horizons
    private var horizons = [Int: Horizon]()


    /// Current thread horizon
    var currentHorizon: Horizon {

        // default horizon if main thread
        if Thread.isMainThread {
            return self.defaultHorizon
        }

        // try to find horizon of current thread
        let threadHash = Thread.current.hash
        if let horizon = self.horizons[threadHash] {
            return horizon
        }

        // create horizon if not existing
        let horizon = self.createHorizon()
        self.horizons[threadHash] = horizon
        return horizon
    }


    /** Create a new horizon for the current thread */
    func createHorizon() -> Horizon {
        return CoreDataHorizon(with: NSManagedObjectContext.mr_())
    }


    // MARK: Init/deinit

    init() {
        // observe that a thread will exit
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(threadWillExit(_:)),
            name: NSNotification.Name.NSThreadWillExit,
            object: nil
        )
    }


    deinit {
        NotificationCenter.default.removeObserver(self)
    }


    // MARK: Notifications

    /** A thread is going to exit */
    @objc func threadWillExit(_ notification: NSNotification) {
        guard let thread = notification.object as? Thread else { return }
        self.horizons.removeValue(forKey: thread.hash)
    }

}
