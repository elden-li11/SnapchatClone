//
//  FeedStates.swift
//  Snapchat
//
//  Created by Elden Li on 3/12/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import Foundation

class FeedStates {
    public static var imagesPosted: [String: [imageState]] = ["Landscapes": [],
                                                              "People": [],
                                                              "City Life": [],
                                                              "Animals": [],
                                                              "CS198-01": []]
}

struct imageState {
    let user: String
    let imageName: String
    let timestamp: Date
    let feed: String
    var opened: Bool
    
    init(_ user: String, _ imageName: String, _ timestamp: Date, _ feed: String) {
        self.user = user
        self.imageName = imageName
        self.timestamp = timestamp
        self.feed = feed
        self.opened = false
    }
}
