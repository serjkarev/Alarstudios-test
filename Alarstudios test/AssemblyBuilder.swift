//
//  AssemblyBuilder.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createLoginModule(router: RouterProtocol) -> UIViewController
    func createSecondModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(router: RouterProtocol) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    func createLoginModule(router: RouterProtocol) -> UIViewController {
        let view = LoginViewController()
        let networkService = NetworkService()
        let presenter = LoginPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createSecondModule(router: RouterProtocol) -> UIViewController {
        let view = SecondViewController()
        let networkService = NetworkService()
        let presenter = SecondPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}