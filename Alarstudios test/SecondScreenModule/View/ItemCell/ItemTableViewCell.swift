//
//  ItemTableViewCell.swift
//  Alarstudios test
//
//  Created by skarev on 27.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import UIKit
import SDWebImage

class ItemTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var myImageView: UIImageView?
    @IBOutlet weak var myTextLabel: UILabel?
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //MARK: - Set Data
    public func setData(text: String?) {
        self.myTextLabel?.text = text
        guard let url: URL = URL(string: "https://static10.tgstat.ru/channels/_0/42/42c72379e2905b47c29ee1234b399e34.jpg") else { return }
        self.myImageView?.sd_setImage(with: url, placeholderImage: UIImage(named: "no-image-icon"))//async image downloading and cashing
    }
}
