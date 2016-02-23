//
//  DemoCell.swift
//  CenturyWind_
//
//  Created by 刘宗岱 on 16/2/18.
//  Copyright © 2016年 蓝之青. All rights reserved.
//

import UIKit

class DemoCell: FoldingCell {

    override func awakeFromNib() {
        
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        
        
        super.awakeFromNib()
    }
    
    override func animationDuration(itemIndex:NSInteger, type:AnimationType)-> NSTimeInterval {
        
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }


}
