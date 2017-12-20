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
    var phoneNumber: String
    var profileImage: UIImage
    var joinDate: Date
    
    init(id: String, phoneNumber: String, profileImage: UIImage, joinDate: Date) {
        self.id = id
        self.phoneNumber = phoneNumber
        self.profileImage = profileImage
        self.joinDate = joinDate
    }
}
