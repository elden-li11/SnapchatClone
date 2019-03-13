//
//  FeedStates.swift
//  Snapchat
//
//  Created by Elden Li on 3/12/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import Foundation

class FeedStates {
    public static var imagesPosted: [imageState] = []
}

struct imageState {
    let name: String
    let timestamp: Date
    let feed: String
    var opened: Bool
    
    init(_ name: String, _ timestamp: Date, _ feed: String) {
        self.name = name
        self.timestamp = timestamp
        self.feed = feed
        self.opened = false
    }
}
