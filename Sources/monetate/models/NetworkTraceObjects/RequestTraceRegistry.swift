//
//  RequestTraceRegistry.swift
//  monetate-ios-sdk
//
//  Created by Hasanul Benna(UST,IN) on 31/08/26.
//  Copyright © 2026 Monetate. All rights reserved.
//

import Foundation

public final class RequestTraceRegistry {

    private var traces: [String: RequestTrace] = [:]
    private let lock = NSLock()

    public init() {}

    @discardableResult
    public func createTrace(requestId: String) -> RequestTrace {
        let trace = RequestTrace(
            requestId: requestId,
            traceId: "trace_\(requestId)"
        )

        lock.lock()
        defer { lock.unlock() }
        traces[requestId] = trace

        return trace
    }

    public func getTrace(requestId: String) -> RequestTrace? {
        lock.lock()
        defer { lock.unlock() }

        return traces[requestId]
    }

    public func updateTrace(_ trace: RequestTrace) {
        lock.lock()
        defer { lock.unlock() }

        guard traces[trace.requestId] != nil else {
            return
        }

        traces[trace.requestId] = trace
    }

    public func removeTrace(requestId: String) {
        lock.lock()
        defer { lock.unlock() }

        traces.removeValue(forKey: requestId)
    }
}
