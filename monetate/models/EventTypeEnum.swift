//
//  EventTypeEnum.swift
//  monetate-ios-sdk
//
//  Created by Umar Sayyed on 08/10/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation


public enum ContextEnum: String, MEvent {
    case UserAgent = "monetate:context:UserAgent"
    case IpAddress = "monetate:context:IpAddress"
    case Referrer = "monetate:context:Referrer"
    case Coordinates = "monetate:context:Coordinates"
    case ScreenSize = "monetate:context:ScreenSize"
    case Language = "monetate:context:Language"
    case Impressions = "monetate:record:Impressions"
    case PageEvents = "monetate:record:PageEvents"
    case PageView = "monetate:context:PageView"
    case EndcapClicks = "monetate:context:EndcapClicks"
    case EndcapImpressions = "monetate:context:EndcapImpressions"
    case Cart = "monetate:context:Cart"
    case AddToCart = "monetate:context:AddToCart"
    case Purchase = "monetate:context:Purchase"
    case ProductDetailView = "monetate:context:ProductDetailView"
    case ProductThumbnailView = "monetate:context:ProductThumbnailView"
    case Metadata = "monetate:context:Metadata"
    case CustomVariables = "monetate:context:CustomVariables"
    case ClosedSession = "monetate:context:ClosedSession"
    case DecisionRequest = "monetate:decision:DecisionRequest"
    case RecClicks = "monetate:record:RecClicks"
    case RecImpressions = "monetate:record:RecImpressions"
}
