//
//  Enviroment.swift
//  Food For All
//
//  Created by Daniel Jones on 1/11/17.
//  Copyright © 2017 Chong500Productions. All rights reserved.
//

import Foundation

enum Environment: String {
    case Development = "development"
    case Production = "production"
    
    //TODO: these need to change to my heroku servers
    var applicationId: String {
        switch self {
        case .Development: return "btownRidesDevelopment43598903845902UFSF"
        case .Production: return "btownRidesProduction3495803840530"
        }
    }
    
    var server: String {
        switch self {
        case .Development: return "https://btown-rides-development.herokuapp.com/parse"
        case .Production: return "https://btown-rides-production.herokuapp.com/parse"
        }
    }
}
