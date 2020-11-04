//
//  QuestionnaireCellTableViewCell.swift
//  nutrition-app
//
//  Created by Tian Shiyu on 11/4/20.
//

import UIKit

class QuestionnaireCellTableViewCell: UITableViewCell {

    @IBOutlet weak var actionBtn: UIButton!
    @IBOutlet weak var selectionBtn: UIButton!
    @IBOutlet weak var selections: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
//        selectionBtn.setImage( UIImage(contentsOfFile:"dot.circle.fill"), for: UIControl.State.normal)

        // Configure the view for the selected state
    }
    
}
