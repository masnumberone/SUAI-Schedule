//
//  ENUM.swift
//  SUAI first
//
//  Created by work on 06.03.2023.
//

import Foundation
import UIKit

extension UIColor {
    class var myBlueDark: UIColor {
//        UIColor(red: 112/255, green: 126/255, blue: 248/255, alpha: 1.0)
        UIColor(red: 0/255, green: 90/255, blue: 170/255, alpha: 1.0)
    }
    
    class var myBlueLight: UIColor {
//        UIColor(red: 232/255, green: 254/255, blue: 252/255, alpha: 1.0)
        UIColor(red: 0/255, green: 108/255, blue: 182/255, alpha: 1.0) // norm
//        UIColor(red: 61/255, green: 127/255, blue: 212/255, alpha: 1.0)
    }
    
    class var myRedDark: UIColor {
//        .red
//        UIColor(red: 171/255, green: 58/255, blue: 141/255, alpha: 1.0)
        UIColor(red: 231/255, green: 15/255, blue: 71/255, alpha: 1.0)
    }
    
    class var myGreen: UIColor {
//        UIColor(red: 87/255, green: 169/255, blue: 124/255, alpha: 1.0)
//        UIColor(red: 0/255, green: 154/255, blue: 73/255, alpha: 1.0)
        UIColor(red: 35/255, green: 89/255, blue: 55/255, alpha: 1.0)
    }
    
}

extension Array<String> {
    func getTeachersString() -> String {
        var teachersString = ""
        self.forEach {
            teachersString += $0.components(separatedBy: " - ")[0] + ", "
        }
        if !self.isEmpty { teachersString.removeLast(2) }
        return teachersString
    }
    
    func getGroupsString() -> String {
        var groupsString = ""
        self.forEach {
            groupsString += $0 + ", "
        }
        if !self.isEmpty { groupsString.removeLast(2) }
        return groupsString
    }
}

enum WeekColor {                                    // уточнить нейминг enum (аппер кейс?)
    case blue
    case red
    case bouth
    case undefined
}

enum DayWeek: Int, Comparable {
    static func < (lhs: DayWeek, rhs: DayWeek) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case undefined = 0
    case monday = 1
    case tuesday = 2
    case wednesday = 3
    case thursday = 4
    case friday = 5
    case saturday = 6
    case sunday = 7
    
    func getString() -> String {
        switch self {
        case .undefined: return "Вне сетки расписания"
        case .monday: return "Понедельник"
        case .tuesday: return "Вторник"
        case .wednesday: return "Среда"
        case .thursday: return "Четверг"
        case .friday: return "Пятница"
        case .saturday: return "Суббота"
        case .sunday: return "Воскресенье"
        }
    }
}
