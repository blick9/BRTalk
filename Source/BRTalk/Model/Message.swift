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
    var date: Date
    
    init(owner: User, contents: MessageContents, date: Date) {
        self.owner = owner
        self.contents = contents
        self.date = date
    }
}
