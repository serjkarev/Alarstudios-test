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
    
    var presenter: ItemsPresenterProtocol?
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

}

//MARK: - Extensions

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = presenter?.items[indexPath.row]
        cell.textLabel?.text = item?.name
        return cell
    }
}

extension ItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ItemsViewController: ItemsViewProtocol {
    func success() {
        self.tableView?.reloadData()
    }
    
    func failure(error: Error) {
        
    }
}
