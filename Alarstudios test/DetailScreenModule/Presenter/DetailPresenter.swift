//
//  DetailPresenter.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import Foundation

//MARK: - DetailViewProtocol
protocol DetailViewProtocol: class {
    func setDetail(item: Datum?)
}

//MARK: - DetailPresenterProtocol
protocol DetailPresenterProtocol: class {
    init(view: DetailViewProtocol, item: Datum, router: RouterProtocol)
    func setDetail()
}

//MARK: - DetailPresenter
class DetailPresenter: DetailPresenterProtocol {
    //MARK: - Instances
    weak var view: DetailViewProtocol?
    var router: RouterProtocol?
    var item: Datum?
    
    //MARK: - Init
    required init(view: DetailViewProtocol, item: Datum, router: RouterProtocol) {
        self.view = view
        self.router = router
        self.item = item
    }
    
    //MARK: - DetailPresenterProtocol methods
    func setDetail() {
        self.view?.setDetail(item: item)
    }
}
