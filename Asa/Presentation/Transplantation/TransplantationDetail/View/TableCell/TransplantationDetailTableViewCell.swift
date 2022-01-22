//
//  TransplantationDetailTableViewCell.swift
//  Asa
//
//  Created by Jehnsen Hirena Kane on 22/01/22.
//

import UIKit

class TransplantationDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var mainIconImg: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
