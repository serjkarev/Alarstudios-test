//
//  ItemsPresenter.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import Foundation

protocol ItemsViewProtocol: class {
    func success()
    func failure(error: Error)
}

protocol ItemsPresenterProtocol: class {
    init(view: ItemsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func itemPressed()
}

class ItemsPresenter: ItemsPresenterProtocol {
    weak var view: ItemsViewProtocol?
    var networkService: NetworkServiceProtocol?
    var router: RouterProtocol?
    
    required init(view: ItemsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getItems()
    }
    
    func getItems() {
        networkService?.getItems(completion: { [weak self] result in
            
        })
    }
    
    func itemPressed() {
        
    }
    
}
