//
//  User.swift
//  Food For All
//
//  Created by Daniel Jones on 1/18/17.
//  Copyright © 2017 Chong500Productions. All rights reserved.
//

import UIKit
import Parse

class User: PFUser {
    //MARK- NSManaged properies
    @NSManaged fileprivate var firstName: String?
    @NSManaged fileprivate var lowercaseFirstName: String?
    @NSManaged var lastName: String?
    @NSManaged var lowercaseLastName: String?
    @NSManaged fileprivate var location: PFGeoPoint?
    @NSManaged var profileImage: PFFile?
    @NSManaged var phoneNumber: Double
    @NSManaged var city: String
    @NSManaged var defaultPaymentMethodStripeID: String
    @NSManaged var isDeleted: Bool
    @NSManaged var arePushNotificationsEnabled: Bool

    var age : Int? {
        if let birthDate = birthDate {
            return calculateAge(birthday: birthDate)
        }
        return nil
    }
    var theFirstName: String {
        get {
            return firstName ?? ""
        }
        set (newValue) {
            firstName = newValue
            lowercaseFirstName = newValue.lowercased()
        }
    }
    var theLastName: String {
        get {
            return lastName ?? ""
        }
        set (newValue) {
            lastName = newValue
            lowercaseLastName = newValue.lowercased()
        }
    }
    var fullName: String? {
        if let firstName = firstName, let lastName = lastName {
            return firstName + " " + lastName
        }
        return nil
    }
    
    var lastLocation: CustomLocation? {
        get {
            if let location = location {
                return CustomLocation(geopoint: location)
            }
            return nil
        }
        set {
            if let newValue = newValue {
                location = PFGeoPoint(latitude: newValue.coordinate.latitude, longitude: newValue.coordinate.longitude)
            }
        }
    }
    
    var formattedPhoneNumber: String {
        return Phone.format(phoneNumber) ?? "Invalid"
    }
}
