//
//  CellWeekday.swift
//  SUAI first
//
//  Created by work on 06.03.2023.
//

import UIKit

class CellWeekday: UICollectionViewCell {
    @IBOutlet private var topLabel: UILabel!
    @IBOutlet private var bottomLabel: UILabel!

//    var selectedBackgroundColor: UIColor?
    
    func configure(top: String, bottom: String, isSelected: Bool, isSunday: Bool, isFree: Bool) {
        topLabel.text = top
        bottomLabel.text = bottom
//        let backgoundView = UIView(frame: bounds)
        if isSunday {
            topLabel.textColor = .myRedDark
            bottomLabel.textColor = .myRedDark
//            selectedBackgroundColor = #colorLiteral(red: 0.9803921569, green: 0.5764705882, blue: 0.6705882353, alpha: 1)
        } else {
            topLabel.textColor = .myBlueDark
            bottomLabel.textColor = .myBlueDark
//            if isSelected { backgoundView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) }
//            selectedBackgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }
        
        
        
        let backgroundView = UIView(frame: bounds)
        backgroundView.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        backgroundView.layer.cornerRadius = 10
        self.backgroundView = backgroundView
        
//        backgoundView.layer.cornerRadius = 10
//        self.selectedBackgroundView = backgoundView
    }
    
    func setBackground(isBlueWeek: Bool) {
        if isSelected && isBlueWeek { backgroundView?.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) }
        else if isSelected && !isBlueWeek {
            backgroundView?.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            bottomLabel.textColor = .white
            topLabel.textColor = .white
        }
        else if !isSelected && isBlueWeek {
            backgroundView?.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
            topLabel.textColor = .myBlueDark
            bottomLabel.textColor = .myBlueDark
        }
        else {
            backgroundView?.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
            topLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            bottomLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
    }
    
    
}
