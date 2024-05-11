//
//  SceneDelegate.swift
//  25. დავალება - Animations - ანიმაციები
//
//  Created by gvantsa gvagvalia on 5/10/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let mainVCViewModel = MainVCViewModel(songModel: SongModel())
        window.rootViewController = UINavigationController(rootViewController: MainVC(mainVCViewModel: mainVCViewModel))
        self.window = window
        window.backgroundColor = .tertiarySystemFill
        window.makeKeyAndVisible()
    }

}

