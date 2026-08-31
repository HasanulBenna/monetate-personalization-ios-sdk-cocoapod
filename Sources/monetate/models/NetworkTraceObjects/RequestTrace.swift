//
//  RequestTrace.swift
//  monetate-ios-sdk
//
//  Created by Hasanul Benna(UST,IN) on 31/08/26.
//  Copyright © 2026 Monetate. All rights reserved.
//

import Foundation

public enum TraceStatus: String {
    case created
    case inProgress
    case completed
    case failed
}

public struct RequestTrace {
    public let requestId: String
    public let traceId: String
    public var status: TraceStatus
    public let createdAt: Date

    // Reserved for future observability
    public var request: Any?
    public var response: Any?
    public var timing: Any?
    public var lifecycle: Any?
    public var error: Any?

    public init(
        requestId: String,
        traceId: String,
        status: TraceStatus = .created,
        createdAt: Date = Date()
    ) {
        self.requestId = requestId
        self.traceId = traceId
        self.status = status
        self.createdAt = createdAt
    }
}
