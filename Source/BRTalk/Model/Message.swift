//
//  Message.swift
//  BRTalk
//
//  Created by Febrix on 2017. 12. 21..
//  Copyright © 2017년 brix. All rights reserved.
//

import Foundation

class Message {
    var owner: User
    var contents: MessageContents
    var isMe: Bool
    var readingCount: Int
    var date: Date
    
    init(owner: User, contents: MessageContents, isMe: Bool, readingCount: Int, date: Date) {
        self.owner = owner
        self.contents = contents
        self.isMe = isMe
        self.readingCount = readingCount
        self.date = date
    }
}
