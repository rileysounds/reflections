//
//  SceneDelegate.swift
//  ReflectionsFM
//
//  Created by Riley Wells on 3/22/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let homeViewController = HomeViewController(rootView: HomeView())
        let musicViewController = MusicViewController(rootView: MusicView())
        let radioViewController = RadioViewController(rootView: RadioView())
        let submissionViewController = SubmissionViewController(rootView: SubmissionView())

        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "1.circle"), tag: 0)
        musicViewController.tabBarItem = UITabBarItem(title: "Music", image: UIImage(systemName: "2.circle"), tag: 1)
        radioViewController.tabBarItem = UITabBarItem(title: "Radio", image: UIImage(systemName: "3.circle"), tag: 2)
        submissionViewController.tabBarItem = UITabBarItem(title: "Submit Music", image: UIImage(systemName: "4.circle"), tag: 3)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeViewController,
                                            musicViewController,
                                            radioViewController,
                                            submissionViewController]
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = tabBarController
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

