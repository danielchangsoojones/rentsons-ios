//
//  ConfigureServer.swift
//  btown-rides-riders
//
//  Created by Daniel Jones on 2/3/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import Foundation
import Parse
import Stripe

class Server {
    func configure(from launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        setParseConfiguration()
        registerSubclasses()
        configureStripe()
    }
    
    private func setParseConfiguration() {
        var appConfiguration = Configuration()
        let configuration = ParseClientConfiguration {
            $0.applicationId = appConfiguration.environment.applicationId
            $0.server = appConfiguration.environment.server
        }
        Parse.initialize(with: configuration)
    }
    
    private func registerSubclasses() {
        User.registerSubclass()
        InstallationParse.registerSubclass()
        LocationParse.registerSubclass()
    }
    
    private func configureStripe() {
        STPPaymentConfiguration.shared().publishableKey = StripeManager.publishableKey
    }
}
