//
//  MessageContents.swift
//  BRTalk
//
//  Created by Febrix on 2017. 12. 21..
//  Copyright © 2017년 brix. All rights reserved.
//

import UIKit
enum MessageType {
    case text
    case photo
    case video
    case emoticon
}

class MessageContents {
    var messageType: MessageType
    var text: String?
    var photo: Photo?
    var description: String
    
    init(messageType: MessageType, text: String) {
        self.messageType = messageType
        self.text = text
        self.description = text
    }
    
    init(messageType: MessageType, photo: Photo) {
        self.messageType = messageType
        self.photo = photo
        self.description = "Photo"
    }
}
