//
//  LoginPresenter.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import Foundation

protocol LoginViewProtocol: class {
    func success()
    func failure(error: Error)
}

protocol LoginPresenterProtocol: class {
    init(view: LoginViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getEnter()
}

class LoginPresenter: LoginPresenterProtocol {    
    weak var view: LoginViewProtocol?
    var networkService: NetworkServiceProtocol?
    var router: RouterProtocol?
    
    required init(view: LoginViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }
    
    func getEnter() {
        
    }
    
}
