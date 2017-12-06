//
//  AppDelegate.swift
//  GRDBTest
//
//  Created by Gereon Steffens on 06.12.17.
//  Copyright © 2017 tarent. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // run this app in iOS11 to produce the "[logging] misuse at line 147939 of [2b0954060f]" log message
        // in iOS11, this message is not produced.

        // apart from the iOS version, this also seems to depend on other code calling sqlite3_config before GRDB gets to do that in the initializer
        // of DatabaseQueue.
        // Examples of how this can easily happen are setting a custom URLCache (like below), or even making HTTP requests using URLSession or Alamofire
        let mb = 1024*1024
        URLCache.shared = URLCache(memoryCapacity: 1 * mb, diskCapacity: 1 * mb, diskPath: nil)

        ProductDB.initialize()

        return true
    }

}

