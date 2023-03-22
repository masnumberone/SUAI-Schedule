//
//  CellDay.swift
//  SUAI first
//
//  Created by work on 25.01.2023.
//

import UIKit
import QuartzCore

class CellDay: UITableViewHeaderFooterView {
    
    @IBOutlet private var dayLabel: UILabel!
    
    func configure(day: String, isBlueWeek: Bool) {
        dayLabel.text = day
        if isBlueWeek {
            dayLabel.textColor = .myBlueDark
        } else {
//            dayLabel.textColor = .gray
//            dayLabel.textColor = .myRedDark
            dayLabel.textColor = .myBlueDark
        }

    }
}

@IBDesignable public class RoundedView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

}
