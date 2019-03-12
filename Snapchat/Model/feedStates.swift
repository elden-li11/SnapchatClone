//
//  FeedStates.swift
//  Snapchat
//
//  Created by Elden Li on 3/12/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import Foundation

class FeedStates {
    public static var feeds: [String: [imageState]] = ["Landscapes": [],
                "People": [],
                "City Life": [],
                "Animals": [],
                "CS198-01": []]
}

struct imageState {
    let name: String
    let timestamp: Date
    
    init(_ name: String, _ timestamp: Date) {
        self.name = name
        self.timestamp = timestamp
    }
}
