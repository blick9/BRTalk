//
//  Chat.swift
//  BRTalk
//
//  Created by Febrix on 2017. 12. 21..
//  Copyright © 2017년 brix. All rights reserved.
//

import UIKit

class Chat {
    var id: String
    var title: String
    var profileImage: UIImage?
    var users: [User]
    var messageStore: [Message]?
    
    init(title: String?, profileImage: UIImage?, users: [User]) {
        self.id = users.count > 1 ? UUID().uuidString : users.first!.id
        self.title = title ?? "\(users.first!.name)"
        self.profileImage = profileImage
        self.users = users
    }
}

extension Chat: Equatable {
    static func ==(lhs: Chat, rhs: Chat) -> Bool {
        return lhs.id == rhs.id
    }
}
