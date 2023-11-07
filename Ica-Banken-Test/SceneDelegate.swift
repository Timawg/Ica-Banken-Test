//
//  SceneDelegate.swift
//  Ica-Banken-Test
//
//  Created by Tim Gunnarsson on 2023-11-06.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    private let networkService = NetworkService()

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let postListViewController = PostListViewController(viewModel: .init(networkService: networkService))
        #warning("Coordinator for navigation")
        window.rootViewController = UINavigationController(rootViewController: postListViewController)
        
        self.window = window
        window.makeKeyAndVisible()
    }
}

