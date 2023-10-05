//
//  SceneDelegate.swift
//  Tamagotchi
//
//  Created by 김하은 on 2023/08/04.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        
        let isLaunched = UserDefaults.standard.bool(forKey: InfoTamagotchi.UserDefaultsKey.isLaunched.rawValue)
        
        if isLaunched{

            let sb = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = sb.instantiateViewController(identifier: MainViewController.identifier) as? MainViewController else { return }
            let nav = UINavigationController(rootViewController: vc)
            window.rootViewController = nav
        }else{
            //다마고치를 고르지 않은 상태(처음)
            let sb = UIStoryboard(name: "Pick", bundle: nil)
            guard let vc = sb.instantiateViewController(identifier: PickViewController.identifier) as? PickViewController else { return }
            window.rootViewController = vc 
        }
        
        window.backgroundColor = .red
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
        UIApplication.shared.applicationIconBadgeNumber = 0
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

