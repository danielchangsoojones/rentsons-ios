//
//  BannerLoader.swift
//  rentsons-ios
//
//  Created by Daniel Jones on 12/9/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import Foundation
import BRYXBanner

struct BannerLoader {
    enum BannerType {
        case error
        case success
    }
    
    static func show(with error: Error?) {
        if let error = error {
            BannerLoader.show(title: "Error", subtitle: error.localizedDescription, bannerType: .error)
        }
    }
    
    static func show(title: String, subtitle: String, bannerType: BannerType = .error, duration: TimeInterval = 10) {
        var backgroundColor: UIColor = UIColor.red
        switch bannerType {
        case .error:
            backgroundColor = UIColor.red
        case .success:
            backgroundColor = UIColor.green
        }
        
        let banner = Banner(title: title, subtitle: subtitle, backgroundColor: backgroundColor)
        banner.dismissesOnTap = true
        banner.show(duration: duration)
    }
}
