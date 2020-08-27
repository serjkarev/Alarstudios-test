//
//  LoginPresenter.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import Foundation

//MARK: - LoginViewProtocol
protocol LoginViewProtocol: class {
    func success()
    func failure(error: Error)
}

//MARK: - LoginPresenterProtocol
protocol LoginPresenterProtocol: class {
    init(view: LoginViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getEnter(userName: String?, passord: String?)
    func goToItemsList()
    
    var auth: Auth? { get set }
}

//MARK: - LoginPresenter
class LoginPresenter: LoginPresenterProtocol {
    //MARK: -
    weak var view: LoginViewProtocol?
    var networkService: NetworkServiceProtocol?
    var router: RouterProtocol?
    var auth: Auth?
    
    //MARK: - Init
    required init(view: LoginViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }
    
    //MARK: - LoginPresenterProtocol methods
    func getEnter(userName: String?, passord: String?) {
        guard let name = userName, let pass = passord else { return }
        networkService?.getAuth(userName: name, password: pass, completion: { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let auth):
                    self.auth = auth
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        })
    }
    
    func goToItemsList() {
        router?.showItems(auth: auth)
    }
}
