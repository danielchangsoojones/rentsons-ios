//
//  ForceUpdate.swift
//  btown-rides-riders
//
//  Created by Daniel Jones on 2/6/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import Foundation
import Siren

// Siren allows 1 day leeway for a new version because it can sometimes take ~24 hours to have the version aggregate through all of the app store correctly. So users will be force updated in 1 day after the release, not immediately. More on this issue here: https://github.com/ArtSabintsev/Siren#words-of-caution
class ForceUpdate {
    init() {
        ForceUpdateParse.check {
            self.configureSiren()
        }
    }
    
    private func configureSiren() {
        // Siren is a singleton
        let siren = Siren.shared
        
        // Optional: Defaults to .option
        siren.alertType = .force
        
        // Optional: Change the various UIAlertController and UIAlertAction messaging. One or more values can be changes. If only a subset of values are changed, the defaults with which Siren comes with will be used.
        siren.alertMessaging = SirenAlertMessaging()
        
        //Occasionally, the iTunes JSON will update faster than the App Store CDN, meaning the JSON may state that the new version of the app has been released, while no new binary is made available for download via the App Store. It is for this reason that Siren will, by default, wait 24 hours after the JSON has been updated to prompt the user to update. To change the default setting, please modify the value of showAlertAfterCurrentVersionHasBeenReleasedForDays.
        siren.showAlertAfterCurrentVersionHasBeenReleasedForDays = 3
        
        // Replace .immediately with .daily or .weekly to specify a maximum daily or weekly frequency for version checks.
        // DO NOT CALL THIS METHOD IN didFinishLaunchingWithOptions IF YOU ALSO PLAN TO CALL IT IN applicationDidBecomeActive.
        siren.checkVersion(checkType: .immediately)
    }
    
    func checkIfForceUpdating() {
        
    }
}
