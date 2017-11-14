//
//  AppDelegate.swift
//  BI-IOS
//
//  Created by Jan Misar on 09.10.17.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().backgroundColor = .red
        UITabBar.appearance().tintColor = .red
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let bubblesController = UINavigationController(rootViewController: BubblesViewController())
        bubblesController.tabBarItem.title = "Bubbles"
        bubblesController.tabBarItem.image = #imageLiteral(resourceName: "tabbaricon")
        bubblesController.tabBarItem.badgeValue = "2"
        
        let table = TableViewController()
        
        let map = MapViewController()
        map.tabBarItem.title = "Map"
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [bubblesController, UINavigationController(rootViewController: table), UINavigationController(rootViewController: map)]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        helloAsyncWorld { (number) in
            print(number)
        }
        
        let method : (Int) -> () = { number in
            print(1)
        }
        
        helloAsyncWorld(callback: method)
        
        helloAsyncWorld(callback: myCallback)
        
        return true
        
    }
    
    func myCallback(number: Int) {
        print(number)
    }
    
    func helloAsyncWorld(callback: (Int) -> ()) {
        callback(1)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

