//
//  AppDelegate.swift
//  ChatGPTNeonApp
//
//  Created by Mustafa Kemal ARDA on 16.04.2024.
//

import UIKit
import NeonSDK
import Firebase
import FirebaseCore


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()

        Font.configureFonts(font: .Inter)
        
        let splashVC = NeonSplashVC(appIcon: UIImage(named: "Splash 1")!, appName: "MyApp", progressBarColors: [.systemBlue, .green], animationDuration: 2)
        
        Neon.configure(window: &window, onboardingVC: OnboardingVC(), paywallVC: HomeVC(), homeVC: HomeVC(), splashVC: splashVC)
        
        return true
    }

}

