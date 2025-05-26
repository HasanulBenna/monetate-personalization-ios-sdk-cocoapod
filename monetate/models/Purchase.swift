//
//  File.swift
//  monetate-ios-sdk-example
//
//  Created by Umar Sayyed on 30/09/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

/** Used to communicate a purchase. Must include line items.  */

public class Purchase: Codable, MEvent {
    
    /** A value which identifies the type of event. */
    public let eventType: String
    /** The account id */
    public var account: String
    /** The account domain (i.e. fifthlevelfashion.com) */
    public var domain: String
    /** The type of instance (i.e. p for production) */
    public var instance: String
    /** Unique identifier for the purchase. */
    public var purchaseId: String
    /** The purchase lines defining the contents of the purchase. */
    public var purchaseLines: [PurchaseLine]?
    
    public init(account: String, domain: String, instance: String, purchaseId: String, purchaseLines: [PurchaseLine]?) {
        eventType = "monetate:context:Purchase"
        self.account = account
        self.domain = domain
        self.instance = instance
        self.purchaseId = purchaseId
        self.purchaseLines = purchaseLines
       // try! checkPurchase()
    }
    
    func checkPurchase () throws {
        if (account == "") {throw PurchaseError.account(description: "Invalid account")}
        if (domain == "") {throw PurchaseError.domain(description: "Invalid domain")}
        if (instance == "") {throw PurchaseError.instance(description: "Invalid instance")}
        if (purchaseId == "") {throw PurchaseError.purchaseId(description: "Invalid purchaseId")}
    }
    
    static func merge (first: [PurchaseLine], second: [PurchaseLine]) -> [PurchaseLine] {
        let merged = Array(Dictionary([first, second].joined().map { ($0.pid, $0)}, uniquingKeysWith: { $1 }).values)
        return merged
    }
}

enum PurchaseError : Error {
    case account(description: String)
    case domain(description: String)
    case instance(description: String)
    case purchaseId(description: String)
}

/** Represents an item in a purchase.  */

public struct PurchaseLine: Codable {
    
    /** The unique identifier for the product. */
    public var sku: String
    /** The parent identifier for a related set of skus. */
    public var pid: String
    /** The number of items purchased. */
    public var quantity: Int
    /** The currency of the purchase value. */
    public var currency: String
    /** The total value of the items. */
    public var value: String
    
    public init(sku: String, pid: String, quantity: Int, currency: String, value: String) {
        self.sku = sku
        self.pid = pid
        self.quantity = quantity
        self.currency = currency
        self.value = value
       // try! checkPurchaseLineItem()
    }
    
    func checkPurchaseLineItem () throws {
        if (sku == "") {throw PurchaseLineError.sku(description: "Invalid sku")}
        if (pid == "") {throw PurchaseLineError.pid(description: "Invalid pid")}
        if (quantity < 0) {throw PurchaseLineError.quantity(description: "Invalid quantity")}
        if (currency == "") {throw PurchaseLineError.currency(description: "Invalid currency")}
        if (value == "") {throw PurchaseLineError.value(description: "Invalid value")}
    }
}

enum PurchaseLineError : Error {
    case sku(description: String)
    case pid(description: String)
    case quantity(description: String)
    case currency(description: String)
    case value(description: String)
}
