//
//  SavedParkingCell.swift
//  Parking Finder
//
//  Created by rodeo station on 10/27/22.
//

import UIKit

class SavedParkingCell: UITableViewCell {

    @IBOutlet weak var parkingImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
