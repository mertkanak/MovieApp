//
//  AppDelegate.swift
//  MovieApp
//
//  Created by mert Kanak on 14.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

        var window: UIWindow?
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
            window?.backgroundColor = .systemBackground
            
            let navigationController = UINavigationController(rootViewController: ViewController())
            window?.rootViewController = navigationController
            
            return true
    
    }
}

