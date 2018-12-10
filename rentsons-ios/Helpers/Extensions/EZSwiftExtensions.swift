//
//  EZSwiftExtensions.swift
//  rentsons-ios
//
//  Created by Daniel Jones on 12/9/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import Foundation
import UIKit

//TODO: EZSwiftExtensions was not working because I had updated to swift 4, so I needed to manually add these function. When EZSwiftExtensions upgrades, then I can fix this.
extension Timer {
    public static func runThisAfterDelay(seconds: Double, after: @escaping () -> Void) {
        runThisAfterDelay(seconds: seconds, queue: DispatchQueue.main, after: after)
    }
    
    public static func runThisAfterDelay(seconds: Double, queue: DispatchQueue, after: @escaping () -> Void) {
        let time = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        queue.asyncAfter(deadline: time, execute: after)
    }
}

extension Double {
    public var toString: String { return String(self) }
}
