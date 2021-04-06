//
//  AppDelegate.swift
//  LineQ
//
//  Created by Ali Alateiyah on 31/03/2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		FirebaseApp.configure()
		window = UIWindow(frame: UIScreen.main.bounds)
		let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
		
		let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//		main.viewControllers = [HomeVC(), SearchVC(), ReservationVC()]
		window?.rootViewController = loginVC
		window?.makeKeyAndVisible()
		
		Auth.auth().addStateDidChangeListener { (_, user) in
			if user != nil {
				print("Your email is \(Auth.auth().currentUser!.email as Any)")
				let mainVC = storyboard.instantiateViewController(withIdentifier: "MainVC") as! MainVC
				let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
				let searchVC = storyboard.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
				let reservationsVC = storyboard.instantiateViewController(withIdentifier: "RservationVC") as! ReservationVC
				mainVC.viewControllers = [homeVC, searchVC, reservationsVC]

				self.window?.rootViewController = mainVC
			} else {
				print("Going LoginVC")
				let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
				self.window?.rootViewController = loginVC
			}
			self.window?.makeKeyAndVisible()
		}
		
		return true
	}

}

