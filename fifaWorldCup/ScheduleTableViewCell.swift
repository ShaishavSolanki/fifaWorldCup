//
//  ScheduleTableViewCell.swift
//  fifaWorldCup
//
//  Created by MacStudent on 2019-03-11.
//  Copyright © 2019 Shaishav Solanki. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var flagFirstTeam: UIImageView!
    @IBOutlet weak var flagSecondTeam: UIImageView!
    @IBOutlet weak var firstTeamLabel: UILabel!
    @IBOutlet weak var secondTeamLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var subscribeButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
