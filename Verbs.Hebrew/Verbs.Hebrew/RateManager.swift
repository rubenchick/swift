//
//  RateManager.swift
//  Verbs.Hebrew
//
//  Created by Anton Rubenchik on 16/05/2019.
//  Copyright © 2019 Anton Rubenchik. All rights reserved.
//

import UIKit
import StoreKit

@available(iOS 10.3, *)
class RateMAnager {
    class func incrementCount() {
        let count = UserDefaults.standard.integer(forKey: keyRunCount)
        if count < countTimesToRequest + 1 {
            UserDefaults.standard.setValue(count + 1, forKey: keyRunCount)
        }
    }
    class func showRatesController() {
        let count = UserDefaults.standard.integer(forKey: keyRunCount)
        if count == countTimesToRequest {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                SKStoreReviewController.requestReview()
            }
        }
    }
}
