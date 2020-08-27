//
//  ItemsPresenter.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import Foundation

//MARK: - ItemsViewProtocol
protocol ItemsViewProtocol: class {
    func success()
    func failure(error: Error)
}

//MARK: - ItemsPresenterProtocol
protocol ItemsPresenterProtocol: class {
    init(view: ItemsViewProtocol, networkService: NetworkServiceProtocol, auth: Auth?, router: RouterProtocol)
    func getItems()
    func itemPressed(_ item: Datum?)
    
    var items: [Datum] { get set }
    var currentPage: Int { get set }
}

//MARK: - ItemsPresenter
class ItemsPresenter: ItemsPresenterProtocol {
    //MARK: - Instances
    weak var view: ItemsViewProtocol?
    var networkService: NetworkServiceProtocol?
    var router: RouterProtocol?
    var auth: Auth?
    var items: [Datum] = []
    var currentPage: Int = 1
    
    //MARK: - Init
    required init(view: ItemsViewProtocol, networkService: NetworkServiceProtocol, auth: Auth?, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        self.auth = auth
        self.getItems()
    }
    
    //MARK: - ItemsPresenterProtocol methods
    func getItems() {
        networkService?.getItemsFor(code: auth?.code, page: currentPage, completion: { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.currentPage += 1
                switch result {
                case .success(let item):
                    if let item = item {
                        self.items.append(contentsOf: item.data)
                        self.view?.success()
                    }
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        })
    }
    
    func itemPressed(_ item: Datum?) {
        guard let item = item else { return }
        router?.showDetail(item)
    }
}
