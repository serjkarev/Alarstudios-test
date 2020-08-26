//
//  SecondViewController.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    //MARK: - Instances
    
    weak var presenter: SecondPresenterProtocol?
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

//MARK: - Extensions

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension SecondViewController: UITableViewDelegate {
    
}

extension SecondViewController: SecondViewProtocol {
    func success() {
        
    }
    
    func failure(error: Error) {
        
    }
}
