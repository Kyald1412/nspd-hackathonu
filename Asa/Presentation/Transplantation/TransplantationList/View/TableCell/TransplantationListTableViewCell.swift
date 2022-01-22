//
//  TransplantationListTableViewCell.swift
//  Asa
//
//  Created by Jehnsen Hirena Kane on 22/01/22.
//

import UIKit

class TransplantationListTableViewCell: UITableViewCell {

    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var progressViewOutlet: UIProgressView!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
