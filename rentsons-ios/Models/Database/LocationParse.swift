//
//  DestinationParse.swift
//  btown-rides-riders
//
//  Created by Daniel Jones on 2/11/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import Foundation
import Parse

class LocationParse: SuperParseObject, PFSubclassing {
    struct Constants {
        static let location = "location"
        static let name = "name"
        static let addressString = "addressString"
    }
    
    class func parseClassName() -> String {
        return "Location"
    }
    
    @NSManaged var location: PFGeoPoint
    @NSManaged var name: String
    @NSManaged var addressString: String
    
    //I need to have the init call super.init() for some reason or else it causes a crash. i'm not sure why
    override init() {
        super.init()
    }
    
    init(location: PFGeoPoint, name: String, addressString: String) {
        super.init()
        self.location = location
        self.name = name
        self.addressString = addressString
    }
    
    func toCustomLocation() -> CustomLocation {
        return CustomLocation(geopoint: location, displayName: name, address: addressString)
    }
}
