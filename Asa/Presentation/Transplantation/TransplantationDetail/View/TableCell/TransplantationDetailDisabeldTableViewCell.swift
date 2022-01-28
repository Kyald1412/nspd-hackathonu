//
//  TransplantationDetailDisabeldTableViewCell.swift
//  Asa
//
//  Created by Jehnsen Hirena Kane on 28/01/22.
//

import UIKit

class TransplantationDetailDisabeldTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var mainIconImg: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.roundCorners(corners: .allCorners, radius: 15)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
