//
//  SuperParseObject.swift
//  btown-rides-riders
//
//  Created by Daniel Jones on 2/5/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import Foundation
import Parse

class SuperParseObject: PFObject {
    struct Constants {
        static let objectId = "objectId"
        static let updatedAt = "updatedAt"
        static let isDeleted = "isDeleted"
    }
    
    @NSManaged var isDeleted: Bool

    override static func query() -> PFQuery<PFObject>? {
        let query = super.query()
        query?.whereKey("isDeleted", notEqualTo: true)
        return query
    }
}
