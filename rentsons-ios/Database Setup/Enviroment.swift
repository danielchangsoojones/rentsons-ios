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
    
    var applicationId: String {
        switch self {
        case .Development: return "rentsonsDevelopment4850385FHDJKGFKT"
        case .Production: return "rentonsProduction58604839FJHDKGLDKJ"
        }
    }
    
    var server: String {
        switch self {
        case .Development: return "https://rentsons-development.herokuapp.com/parse"
        case .Production: return "https://rentsons-production.herokuapp.com/parse"
        }
    }
}
