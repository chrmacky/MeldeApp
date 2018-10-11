//
//  ReportDetailTableViewCell.swift
//  MeldeApp
//
//  Created by Christoph Lemke on 11.10.18.
//  Copyright © 2018 Christoph Lemke. All rights reserved.
//

import UIKit

class ReportDetailTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var reportName: UILabel!
    @IBOutlet weak var reportOriginator: UILabel!
    @IBOutlet weak var reportProgress: ProgressControl!
    @IBOutlet weak var reportPhotoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
