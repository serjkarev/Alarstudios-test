//
//  DetailViewController.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - IBOutlets
    
    
    //MARK: - Instances
    
    weak var presenter: DetailPresenterProtocol?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

//MARK: - Extensions

extension DetailViewController: DetailViewProtocol {
    
}
