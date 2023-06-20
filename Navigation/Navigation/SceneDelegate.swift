//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Sergey Bersenev on 05.06.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) { 

        guard let _ = (scene as? UIWindowScene) else { return }

        guard let windowScene = (scene as? UIWindowScene) else { return }

        //Создаем windows
        let window = UIWindow(windowScene: windowScene)


        let profileViewController = LogInViewController()
        let profileNovigationViewController = UINavigationController(rootViewController: profileViewController)
        profileNovigationViewController.tabBarItem.title = "Profile"
        profileNovigationViewController.tabBarItem.image = UIImage(named: "Profile_Logo")

        let feedViewController = FeedViewController()
        let feedNovigationViewController = UINavigationController(rootViewController: feedViewController)
        feedNovigationViewController.tabBarItem.title = "Feed"
        feedNovigationViewController.tabBarItem.image = UIImage(named: "Feed_Logo")

        let tabViewController = UITabBarController()
        tabViewController.viewControllers = [feedNovigationViewController, profileNovigationViewController]
        tabViewController.tabBar.backgroundColor = UIColor.white
        tabViewController.tabBar.tintColor = UIColor.blue

        window.rootViewController = tabViewController

        self.window = window
        window.makeKeyAndVisible()

    }

}

