//
//  InstallationParse.swift
//  btown-rides-drivers
//
//  Created by Daniel Jones on 8/22/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import Foundation
import Parse

class InstallationParse: PFInstallation {
    @NSManaged var user: User
    
    /*
     This is how you set up push notification channels for drivers
     */
    static func register(_ deviceToken: Data) {
        let installation = InstallationParse.current()
        setCurrentUser(for: installation)
        installation?.setDeviceTokenFrom(deviceToken)
        installation?.saveInBackground()
    }
    
    private static func setCurrentUser(for installation: InstallationParse?) {
        if let currentUser = User.current() {
            installation?.user = currentUser
        }
    }
}
