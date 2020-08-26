//
//  DetailPresenter.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import Foundation

protocol DetailViewProtocol: class {
    
}

protocol DetailPresenterProtocol: class {
    init(view: DetailViewProtocol, router: RouterProtocol)
}

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    var router: RouterProtocol?
    
    required init(view: DetailViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
}
