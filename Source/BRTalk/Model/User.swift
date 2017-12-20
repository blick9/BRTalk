//
//  User.swift
//  BRTalk
//
//  Created by Febrix on 2017. 12. 21..
//  Copyright © 2017년 brix. All rights reserved.
//

import UIKit

class User {
    var id: String
    var name: String
    var phoneNumber: String
    var profileImage: UIImage?
    var joinDate: Date
    
    init(name: String, phoneNumber: String, profileImage: UIImage?, joinDate: Date) {
        self.id = UUID().uuidString
        self.name = name
        self.phoneNumber = phoneNumber
        self.profileImage = profileImage
        self.joinDate = joinDate
    }
}
