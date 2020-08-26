//
//  SecondPresenter.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import Foundation

protocol SecondViewProtocol: class {
    func success()
    func failure(error: Error)
}

protocol SecondPresenterProtocol: class {
    init(view: SecondViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func itemPressed()
}

class SecondPresenter: SecondPresenterProtocol {
    weak var view: SecondViewProtocol?
    var networkService: NetworkServiceProtocol?
    var router: RouterProtocol?
    
    required init(view: SecondViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }
    
    func itemPressed() {
        
    }
    
}
