//
//  EventQueueManager.swift
//  monetate-ios-sdk
//
//  Created by Hasanul Benna(UST,IN) on 29/07/25.
//  Copyright © 2025 Monetate. All rights reserved.
//

import Foundation

final class EventQueueManager {
    private var queue: [ContextEnum: MEvent] = [:]
    private let serialSyncQueue = DispatchQueue(label: "sdk.Monetate.serialSyncQueue")

    func getQueueSnapshot() -> [ContextEnum: MEvent] {
        return serialSyncQueue.sync { queue }
    }

    func getEvent(for context: ContextEnum) -> MEvent? {
        return serialSyncQueue.sync { queue[context] }
    }

    func updateQueue(_ newQueue: [ContextEnum: MEvent]) {
        serialSyncQueue.sync {
            self.queue = newQueue
        }
    }
    
    func setEvent(_ event: MEvent, for context: ContextEnum) {
        serialSyncQueue.sync {
            self.queue[context] = event
        }
    }
    
}


final class SearchPrerequisiteManager {
    private var prerequisite: SearchPreRequisite?
    private let serialSyncQueue = DispatchQueue(label: "sdk.Monetate.searchPrerequisite.serialSyncQueue")

    func get() -> SearchPreRequisite? {
        serialSyncQueue.sync { prerequisite }
    }

    func set(_ newValue: SearchPreRequisite?, completion: (() -> Void)? = nil) {
        serialSyncQueue.async {
            self.prerequisite = newValue
            completion?()
        }
    }
}

