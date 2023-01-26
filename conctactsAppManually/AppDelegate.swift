//
//  AppDelegate.swift
//  conctactsAppManually
//
//  Created by NELSON ABEL  BARRANZUELA IMAN on 16/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
       window = UIWindow(frame: UIScreen.main.bounds)
//       window?.rootViewController = ContactsViewController()
       window?.rootViewController = UINavigationController(rootViewController: ContactsViewController_temp())
       window?.makeKeyAndVisible()
    
       
        return true
    }

}

