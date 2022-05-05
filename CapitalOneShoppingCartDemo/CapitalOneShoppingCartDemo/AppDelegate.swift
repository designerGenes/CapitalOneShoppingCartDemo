//
//  AppDelegate.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Jaden Nation on 4/25/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        var products = [Product]()
//        let product = Product(id: 1, title: "yes", price: 100, description: "ahsd", discountPercentage: 3.3, rating: 3.3, stock: 2, brand: "df", category: "df", thumbnail: "dsf")
//        let product1 = Product(id: 1, title: "yes", price: 100, description: "ahsd", discountPercentage: 3.3, rating: 3.3, stock: 2, brand: "df", category: "df", thumbnail: "dsf")
//        products.append(product)
//        products.append(product1)
//        
//        let repo = ProductsRepository()
//        repo.set(records: products)
//
//        print(repo.getAll())
        
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

