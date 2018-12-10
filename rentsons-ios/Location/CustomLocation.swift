//
//  CustomLocation.swift
//  btown-rides-riders
//
//  Created by Daniel Jones on 2/11/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import Foundation
import Parse
import GoogleMaps

class CustomLocation {
    var coordinate: CLLocationCoordinate2D
    let displayName: String
    let address: String
    
    var completeName: String {
        return displayName + "\n" + address
    }
    
    init(coordinate: CLLocationCoordinate2D, displayName: String, address: String) {
        self.coordinate = coordinate
        self.displayName = displayName
        self.address = address
    }
    
    convenience init(geopoint: PFGeoPoint, displayName: String, address: String) {
        let coordinate = CLLocationCoordinate2D(latitude: geopoint.latitude, longitude: geopoint.longitude)
        self.init(coordinate: coordinate, displayName: displayName, address: address)
    }
    
    convenience init(geopoint: PFGeoPoint) {
        let coordinate = CLLocationCoordinate2D(latitude: geopoint.latitude, longitude: geopoint.longitude)
        self.init(coordinate: coordinate, displayName: "", address: "")
    }
    
    convenience init(coordinate: CLLocationCoordinate2D) {
        self.init(coordinate: coordinate, displayName: "", address: "")
    }
    
    convenience init() {
        let coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        self.init(coordinate: coordinate, displayName: "", address: "")
    }
    
    func toDestinationParse() -> LocationParse {
        return LocationParse(location: toGeoPoint,
                                name: displayName,
                                addressString: address)
    }
    
    var toGeoPoint: PFGeoPoint {
        return PFGeoPoint(latitude: coordinate.latitude,
                          longitude: coordinate.longitude)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

extension CustomLocation {
    var city: City {
        return City.rawValue(customLocation: self)
    }
    
    //TODO: Change the cities to Patrick's cities
    enum City: String, CaseIterable {
        case indianapolis_downtown, bloomington,
        indianapolis_broadripple, urbana_champaign
        
        var databaseKey: String {
            switch self {
            case .indianapolis_downtown:
                return "indianapolis_downtown"
            case .indianapolis_broadripple:
                return "indianapolis_broadripple"
            case .bloomington:
                return "bloomington"
            case .urbana_champaign:
                return "urbana_champaign"
            }
        }
        
        //TODO: one day, I'd like to get this from the serverside.
        var bounds: GMSCoordinateBounds {
            var northEastCorner = CLLocationCoordinate2D(latitude: 0, longitude: 0)
            var southwestCorner = CLLocationCoordinate2D(latitude: 0, longitude: 0)
            switch self {
            case .bloomington:
                northEastCorner = CLLocationCoordinate2D(latitude: 39.20512, longitude: -86.435595)
                southwestCorner = CLLocationCoordinate2D(latitude: 39.09969, longitude: -86.641937)
            case .indianapolis_broadripple, .indianapolis_downtown:
                northEastCorner = CLLocationCoordinate2D(latitude: 40.04443, longitude: -85.74829)
                southwestCorner = CLLocationCoordinate2D(latitude: 39.57393, longitude: -86.48437)
            case .urbana_champaign:
                northEastCorner = CLLocationCoordinate2D(latitude: 40.17471, longitude: -88.10128)
                southwestCorner = CLLocationCoordinate2D(latitude: 39.10662, longitude: -88.09544)
            }
            
            return GMSCoordinateBounds(coordinate: northEastCorner, coordinate: southwestCorner)
        }
        
        static func rawValue(customLocation: CustomLocation) -> City {
            for city in City.allCases {
                if city.bounds.contains(customLocation.coordinate) {
                    return city
                }
            }
            
            return .bloomington
        }
    }
}
