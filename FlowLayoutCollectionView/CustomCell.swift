//
//  CustomCell.swift
//  FlowLayoutCollectionView
//
//  Created by akatsuki174 on 2017/06/12.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        label.preferredMaxLayoutWidth = 250
    }
    
    class func fromNib() -> CustomCell?
    {
        var cell: CustomCell?
        let nibViews = Bundle.main.loadNibNamed("CustomCell", owner: nil, options: nil)
        for nibView in nibViews! {
            if let cellView = nibView as? CustomCell {
                cell = cellView
            }
        }
        return cell
    }

}
