//
//  AssemblyBuilder.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import UIKit

//MARK: - AssemblyBuilderProtocol
protocol AssemblyBuilderProtocol {
    func createLoginModule(router: RouterProtocol) -> UIViewController
    func createItemsModule(auth: Auth?, router: RouterProtocol) -> UIViewController
    func createDetailModule(item: Datum, router: RouterProtocol) -> UIViewController
}

//MARK: - AssemblyBuilder
class AssemblyBuilder: AssemblyBuilderProtocol {
    //MARK: - AssemblyBuilderProtocol methods
    func createLoginModule(router: RouterProtocol) -> UIViewController {
        let view = LoginViewController()
        let networkService = NetworkService()
        let presenter = LoginPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createItemsModule(auth: Auth?, router: RouterProtocol) -> UIViewController {
        let view = ItemsViewController()
        let networkService = NetworkService()
        let presenter = ItemsPresenter(view: view, networkService: networkService, auth: auth, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(item: Datum, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, item: item, router: router)
        view.presenter = presenter
        return view
    }
}
