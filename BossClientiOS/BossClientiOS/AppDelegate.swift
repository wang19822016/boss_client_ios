//
//  AppDelegate.swift
//  BossClientiOS
//
//  Created by seastar on 2017/1/19.
//  Copyright © 2017年 seastar. All rights reserved.
//

import UIKit
import AppsFlyerLib


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        AppsFlyerTracker.shared().appleAppID = "";
        AppsFlyerTracker.shared().appsFlyerDevKey = "";
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        AppsFlyerTracker.shared().trackAppLaunch();
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        AppsFlyerTracker.shared().registerUninstall(deviceToken);
    }



}

