//
//  User.swift
//  Deal
//
//  Created by Feng Yichen on 2019/4/26.
//  Copyright © 2019 Nina Xie. All rights reserved.
//

import Foundation
import UIKit

//profile image and user name from google account

class User {
    var userName: String
    var profileImage: UIImage?
    var personalInformation: String
    
    init(userName: String, profileImageName:String, personalInformation: String ){
        self.userName = userName
        profileImage = UIImage(named: profileImageName)
        self.personalInformation = personalInformation
    }
}
