//
//  AppDelegate.swift
//  ColorMemoApp
//
//  Created by Taku Yamada on 2020/11/17.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let themeColorTypeKey = "ThemeColorType"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let themeColorTypeInt = UserDefaults.standard.integer(forKey: themeColorTypeKey)
        let themeColorType = MyColorType(rawValue: themeColorTypeInt) ?? .default
        let textColor: UIColor = themeColorType == .default ? .black : .white
        UINavigationBar.appearance().tintColor = textColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: textColor]
        UINavigationBar.appearance().barTintColor = themeColorType.color
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

