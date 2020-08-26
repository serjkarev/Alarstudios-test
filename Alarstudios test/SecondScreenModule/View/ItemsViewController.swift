//
//  ItemsViewController.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {

    //MARK: - Instances
    
    weak var presenter: ItemsPresenterProtocol?
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

//MARK: - Extensions

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension ItemsViewController: UITableViewDelegate {
    
}

extension ItemsViewController: ItemsViewProtocol {
    func success() {
        
    }
    
    func failure(error: Error) {
        
    }
}
