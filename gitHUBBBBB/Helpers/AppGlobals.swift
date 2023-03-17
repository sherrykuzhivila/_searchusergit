//
//  AppGlobals.swift
//  gitHUBBBBB
//
//  Created by Admin on 17/03/23.
//

import Foundation
import UIKit
let networkLayer = NetworkLayer.shared
let userDefaults = UserDefaults(suiteName: "\(Bundle.main.bundleIdentifier ?? "").bundleIdentifier") ?? UserDefaults.standard
//let cacheManager = GlobalCacheManager.shared
var accessToken: String? {
    get {
        if let token = userDefaults.string(forKey: UserdefaultKeys.accessToken.rawValue), token.count > 0 {
            return "Bearer \(token)"
        }
        return nil
    }
    set {
        if let accessToken = newValue {
            userDefaults.setValue(accessToken, forKey: UserdefaultKeys.accessToken.rawValue)
        }
    }
}
var socialEmail: Bool? {
    get {
        if let socialEmail:Bool? = userDefaults.bool(forKey: UserdefaultKeys.socialEmail.rawValue) {
            return socialEmail ?? false
        }
        return nil
    }
    set {
        if let socialEmail = newValue {
            userDefaults.setValue(socialEmail, forKey: UserdefaultKeys.socialEmail.rawValue)
        }
    }}

var socialFlowStatus: Bool? {
    get {
        if let socialFlowStatus:Bool? = userDefaults.bool(forKey: UserdefaultKeys.socialFlowStatus.rawValue) {
            return socialFlowStatus ?? false
        }
        return nil
    }
    set {
        if let socialFlowStatus = newValue {
            userDefaults.setValue(socialFlowStatus, forKey: UserdefaultKeys.socialFlowStatus.rawValue)
        }
    }}



var device_Token: String? {
    get {
        if let device_Token = userDefaults.string(forKey: UserdefaultKeys.device_Token.rawValue), device_Token.count > 0 {
            return "\(device_Token)"
        }
        return nil
    }
    set {
        if let device_Token = newValue {
            userDefaults.setValue(device_Token, forKey: UserdefaultKeys.device_Token.rawValue)
        }
    }
}
var appleUserName: String? {
    get {
        if let name = userDefaults.string(forKey: UserdefaultKeys.appleUserName.rawValue), name.count > 0 {
            return "\(name)"
        }
        return nil
    }
    set {
        if let userName = newValue {
            userDefaults.setValue(userName, forKey: UserdefaultKeys.appleUserName.rawValue)
        }
    }
}
var endDateSelected: String? {
    get {
        if let endDateSelected = userDefaults.string(forKey: UserdefaultKeys.endDateSelected.rawValue), endDateSelected.count > 0 {
            return "\(endDateSelected)"
        }
        return nil
    }
    set {
        if let endDateSelected = newValue {
            userDefaults.setValue(endDateSelected, forKey: UserdefaultKeys.endDateSelected.rawValue)
        }
    }
}
var startDateSelected: String? {
    get {
        if let startDateSelected = userDefaults.string(forKey: UserdefaultKeys.startDateSelected.rawValue), startDateSelected.count > 0 {
            return "\(startDateSelected)"
        }
        return nil
    }
    set {
        if let startDateSelected = newValue {
            userDefaults.setValue(startDateSelected, forKey: UserdefaultKeys.startDateSelected.rawValue)
        }
    }
}
var selectedCategory: String? {
    get {
        if let selectedCategory = userDefaults.string(forKey: UserdefaultKeys.selectedCategory.rawValue), selectedCategory.count > 0 {
            return "\(selectedCategory)"
        }
        return nil
    }
    set {
        if let selectedCategory = newValue {
            userDefaults.setValue(selectedCategory, forKey: UserdefaultKeys.selectedCategory.rawValue)
        }
    }
}
var socialLastName: String? {
    get {
        if let socialLastName = userDefaults.string(forKey: UserdefaultKeys.socialLastName.rawValue), socialLastName.count > 0 {
            return "\(socialLastName)"
        }
        return nil
    }
    set {
        if let socialLastName = newValue {
            userDefaults.setValue(socialLastName, forKey: UserdefaultKeys.socialLastName.rawValue)
        }
    }
}
var PhoneNumber: String? {
    get {
        if let PhoneNumber = userDefaults.string(forKey: UserdefaultKeys.PhoneNumber.rawValue), PhoneNumber.count > 0 {
            return "\(PhoneNumber)"
        }
        return nil
    }
    set {
        if let PhoneNumber = newValue {
            userDefaults.setValue(PhoneNumber, forKey: UserdefaultKeys.PhoneNumber.rawValue)
        }
    }
}
var verifyID: String? {
    get {
        if let verificationID = userDefaults.string(forKey: UserdefaultKeys.verifyID.rawValue), verificationID.count > 0 {
            return "\(verificationID)"
        }
        return nil
    }
    set {
        if let verificationID = newValue {
            userDefaults.setValue(verificationID, forKey: UserdefaultKeys.verifyID.rawValue)
        }
    }
}
var appleUserEmail: String? {
    get {
        if let name = userDefaults.string(forKey: UserdefaultKeys.appleUserEmail.rawValue), name.count > 0 {
            return "\(name)"
        }
        return nil
    }
    set {
        if let userName = newValue {
            userDefaults.setValue(userName, forKey: UserdefaultKeys.appleUserEmail.rawValue)
        }
    }
}
var userId: String? {
    get {
        if let userId = userDefaults.string(forKey: UserdefaultKeys.userId.rawValue), userId.count > 0 {
            return "\(userId)"
        }
        return nil
    }
    set {
        if let userId = newValue {
            userDefaults.setValue(userId, forKey: UserdefaultKeys.userId.rawValue)
        }
    }
}
var user_Name: String? {
    get {
        if let user_Name = userDefaults.string(forKey: UserdefaultKeys.user_Name.rawValue), user_Name.count > 0 {
            return "\(user_Name)"
        }
        return nil
    }
    set {
        if let user_Name = newValue {
            userDefaults.setValue(user_Name, forKey: UserdefaultKeys.user_Name.rawValue)
        }
    }
}
var user_Gender: String? {
    get {
        if let user_Gender = userDefaults.string(forKey: UserdefaultKeys.user_Gender.rawValue), user_Gender.count > 0 {
            return "\(user_Gender)"
        }
        return nil
    }
    set {
        if let user_Gender = newValue {
            userDefaults.setValue(user_Gender, forKey: UserdefaultKeys.user_Gender.rawValue)
        }
    }
}
var userImage: String? {
    get {
        if let userImage = userDefaults.string(forKey: UserdefaultKeys.userImage.rawValue), userImage.count > 0 {
            return "\(userImage)"
        }
        return nil
    }
    set {
        if let userImage = newValue {
            userDefaults.setValue(userImage, forKey: UserdefaultKeys.userImage.rawValue)
        }
    }
}
var socialFirstName: String? {
    get {
        if let socialFirstName = userDefaults.string(forKey: UserdefaultKeys.socialFirstName.rawValue), socialFirstName.count > 0 {
            return "\(socialFirstName)"
        }
        return nil
    }
    set {
        if let socialFirstName = newValue {
            userDefaults.setValue(socialFirstName, forKey: UserdefaultKeys.socialFirstName.rawValue)
        }
    }
}
var AppleFirstName: String? {
    get {
        if let AppleFirstName = userDefaults.string(forKey: UserdefaultKeys.AppleFirstName.rawValue), AppleFirstName.count > 0 {
            return "\(AppleFirstName)"
        }
        return nil
    }
    set {
        if let AppleFirstName = newValue {
            userDefaults.setValue(AppleFirstName, forKey: UserdefaultKeys.AppleFirstName.rawValue)
        }
    }
}

var AppleLastName: String? {
    get {
        if let AppleLastName = userDefaults.string(forKey: UserdefaultKeys.AppleLastName.rawValue), AppleLastName.count > 0 {
            return "\(AppleLastName)"
        }
        return nil
    }
    set {
        if let AppleLastName = newValue {
            userDefaults.setValue(AppleLastName, forKey: UserdefaultKeys.AppleLastName.rawValue)
        }
    }
}
var AppleEmail: String? {
    get {
        if let AppleEmail = userDefaults.string(forKey: UserdefaultKeys.AppleEmail.rawValue), AppleEmail.count > 0 {
            return "\(AppleEmail)"
        }
        return nil
    }
    set {
        if let AppleEmail = newValue {
            userDefaults.setValue(AppleEmail, forKey: UserdefaultKeys.AppleEmail.rawValue)
        }
    }
}

var socialImage: String? {
    get {
        if let socialImage = userDefaults.string(forKey: UserdefaultKeys.socialImage.rawValue), socialImage.count > 0 {
            return "\(socialImage)"
        }
        return nil
    }
    set {
        if let socialImage = newValue {
            userDefaults.setValue(socialImage, forKey: UserdefaultKeys.socialImage.rawValue)
        }
    }
}
var stepNo: Int? {
    get {
        if let step = userDefaults.string(forKey: UserdefaultKeys.step.rawValue) {
            
            return Int(step)
        }
        return nil
    }
    set {
        if let step = newValue {
            userDefaults.setValue(step, forKey: UserdefaultKeys.step.rawValue)
        }
    }
}
var isFromProfile: Bool? {
    get {
        if let isFromProfile : Bool? = userDefaults.bool(forKey: UserdefaultKeys.isFromProfile.rawValue)    {
            return isFromProfile ?? false
        }
        return nil
    }
    set {
        if let isFromProfile = newValue {
            userDefaults.setValue(isFromProfile, forKey: UserdefaultKeys.isFromProfile.rawValue)
        }
    }
}

var appDel: AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
}

enum UserdefaultKeys : String {
    case accessToken = "accessToken"
    case userId = "userId"
    case step = "step"
    case user_Name = "user_Name"
    case userImage = "userImage"
    case user_Gender = "user_Gender"
    case device_Token = "device_Token"
    case appleUserName = "appleUserName"
    case appleUserEmail = "appleUserEmail"
    case isFromProfile = "isFromProfile"
    case socialFirstName = "socialFirstName"
    case socialLastName = "socialLastName"
    case socialEmail = "socialEmail"
    case socialImage = "socialImage"
    case socialFlowStatus = "socialFlowStatus"
    case AppleFirstName = "AppleFirstName"
    case AppleLastName = "AppleLastName"
    case AppleEmail = "AppleEmail"
    case verifyID = "verificationID"
    case PhoneNumber = "PhoneNumber"
    case selectedCategory = "selectedCategory"
    case startDateSelected = "startDateSelected"
    case endDateSelected = "endDateSelected"
}

