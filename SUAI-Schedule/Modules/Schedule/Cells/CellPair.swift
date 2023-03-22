//
//  Cell.swift
//  SUAI first
//
//  Created by work on 23.01.2023.
//

import UIKit
import QuartzCore

class CellPair: UITableViewCell {
 
    @IBOutlet private var startLabel: UILabel!
    @IBOutlet private var endLabel: UILabel!
    @IBOutlet private var subjectLabel: UILabel!
    @IBOutlet private var groupLabel: UILabel!
    @IBOutlet private var audienceLabel: UILabel!
    @IBOutlet private var teacherLabel: UILabel!
//    @IBOutlet private var numberLabel: UILabel!
    @IBOutlet private var topLine: UIView!
    @IBOutlet private var bottomLine: UIView!
    @IBOutlet private var circleView: UIView!
    @IBOutlet private var subjectBackView: UIView!
    
    func configure(start: String, end: String, subject: String, group: String, audience: String, teacher: String, isFirst: Bool, isLast: Bool) {
        startLabel.text = start
        endLabel.text = end
        subjectLabel.text = subject
        groupLabel.text = group
        audienceLabel.text = audience
        teacherLabel.text = teacher
        if isFirst { topLine.alpha = 0 } else { topLine.alpha = 1 }
        if isLast { bottomLine.alpha = 0 } else { bottomLine.alpha = 1 }
    }
    
    private func configureCircle(isPour: Bool, color: UIColor) {
//        let rect = CGRect(origin: .zero, size: CGSize(width: 10, height: 10))
        let sizeExtern = 16.0
        let sizeMid = 12.0
        let sizeIntern = 8.0
        
        if isPour {
            let circleExtern = UIView(frame: CGRect(origin: .zero, size: CGSize(width: sizeExtern, height: sizeExtern)))
            circleExtern.backgroundColor = color
            circleExtern.layer.cornerRadius = sizeExtern/2
            circleExtern.center = CGPoint(x: 8, y: 8)
            circleView.addSubview(circleExtern)
            
            let circleMid = UIView(frame: CGRect(origin: .zero, size: CGSize(width: sizeMid, height: sizeMid)))
            circleMid.backgroundColor = .white
            circleMid.layer.cornerRadius = sizeMid/2
            circleMid.center = CGPoint(x: 8, y: 8)
            circleView.addSubview(circleMid)
            
            let circleIntern = UIView(frame: CGRect(origin: .zero, size: CGSize(width: sizeIntern, height: sizeIntern)))
            circleIntern.backgroundColor = color
            circleIntern.layer.cornerRadius = sizeIntern/2
            circleIntern.center = CGPoint(x: 8, y: 8)
            circleView.addSubview(circleIntern)
        } else {
            let circleExtern = UIView(frame: CGRect(origin: .zero, size: CGSize(width: sizeExtern, height: sizeExtern)))
            circleExtern.backgroundColor = .white
            circleExtern.layer.cornerRadius = sizeExtern/2
            circleExtern.center = CGPoint(x: 8, y: 8)
            circleView.addSubview(circleExtern)
            
            let circleMid = UIView(frame: CGRect(origin: .zero, size: CGSize(width: sizeMid, height: sizeMid)))
            circleMid.backgroundColor = color
            circleMid.layer.cornerRadius = sizeMid/2
            circleMid.center = CGPoint(x: 8, y: 8)
            circleView.addSubview(circleMid)
            
            let circleIntern = UIView(frame: CGRect(origin: .zero, size: CGSize(width: sizeIntern, height: sizeIntern)))
            circleIntern.backgroundColor = .white
            circleIntern.layer.cornerRadius = sizeIntern/2
            circleIntern.center = CGPoint(x: 8, y: 8)
            circleView.addSubview(circleIntern)
        }
        
    }
    
    func configureColor(isBlueWeek: Bool, isPassed: Bool) {
        if isBlueWeek {
            if isPassed {
                subjectBackView.backgroundColor = .myBlueLight
                subjectLabel.textColor = .white
                topLine.backgroundColor = .myBlueDark
                bottomLine.backgroundColor = .myBlueDark
            } else {
                subjectBackView.backgroundColor = .myBlueLight
                subjectLabel.textColor = .black
                topLine.backgroundColor = .myBlueLight
                bottomLine.backgroundColor = .myBlueLight
            }

            configureCircle(isPour: isPassed, color: .myBlueDark)
        } else {
//            subjectBackView.backgroundColor = .myBlueLight - красный фон
//            subjectLabel.textColor = .white
//            topLine.backgroundColor = .myRedDark
//            bottomLine.backgroundColor = .myRedDark
//            configureCircle(isPour: isPassed, color: .myRedDark)
            
            subjectBackView.backgroundColor = .myBlueDark
            subjectLabel.textColor = .white
            topLine.backgroundColor = .myBlueDark
            bottomLine.backgroundColor = .myBlueDark
            configureCircle(isPour: isPassed, color: .myBlueDark)
        }

        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subjectBackView.layer.cornerRadius = 10
        
    }
    
}

