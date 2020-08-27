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
        self.tableView?.register(UINib.init(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
    }
}

//MARK: - Extensions

    //MARK: - UITableViewDataSource methods
extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell {
            let item = presenter?.items[indexPath.row]
            cell.setData(text: item?.name)
            return cell
        }
        return UITableViewCell()
    }
}

    //MARK: - UITableViewDelegate methods
extension ItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row >= ((presenter?.items.count)! - 1) {
            let spinner = UIActivityIndicatorView(style: .medium)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(144))
            self.tableView?.tableFooterView = spinner
            self.tableView?.tableFooterView?.isHidden = false
            presenter?.getItems()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.itemPressed(presenter?.items[indexPath.row])
    }
}

    //MARK: - ItemsViewProtocol methods
extension ItemsViewController: ItemsViewProtocol {
    func success() {
        self.tableView?.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
