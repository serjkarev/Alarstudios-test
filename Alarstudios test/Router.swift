//
//  Router.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import UIKit

protocol MainRouter {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: MainRouter {
    func initialViewController()
    func showItems(auth: Auth?)
    func showDetail()
//    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let loginViewController = assemblyBuilder?.createLoginModule(router: self) else { return }
            navigationController.viewControllers = [loginViewController]
        }
    }
    
    func showItems(auth: Auth?) {
        if let navigationController = navigationController {
            guard let itemsViewController = assemblyBuilder?.createItemsModule(auth: auth, router: self) else { return }
            navigationController.pushViewController(itemsViewController, animated: true)
        }
    }
    
    func showDetail() {
        
    }
    
    
}
