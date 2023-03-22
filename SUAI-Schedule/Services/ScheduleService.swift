//
//  ScheduleService.swift
//  SUAI first
//
//  Created by work on 26.01.2023.
//

import Foundation
import SUAI

class ScheduleService {
    
    static let shared: ScheduleService = { ScheduleService() }()
    private init() {
        SUAI.instance()
    }
    
    func getPairsFor(group: String, success: @escaping ([Day]) -> (), error: @escaping (String) -> ()) {
        SUAI.instance().schedule.loadSchedule(for: group, of: .group) { schedule in
            
            let scheduleMap = schedule.semester!.compactMap({ $0 as SUAIDay})
            var days = [Day]()
            var tmpPairs = [Pair]()
            
            for day in scheduleMap {
                for pair in day.pairs {
                    tmpPairs.append(self.configurePairFrom(suaiPair: pair))
                }
                days.append(self.configureDayFrom(suaiDay: day, pairs: tmpPairs))
                tmpPairs.removeAll()
            }

            success(days)
            
        } fail: { suaiError in
            error(suaiError.description)
        }
    }
    
    func getPairsFor(teacher: String) {
        
    }
    
    func getPairsFor(audience: String) {
        
    }
    
    func getCurrentWeekColor() -> WeekColor {
        switch SUAI.instance().schedule.currentWeekType {
            case .blue: return .blue
            case .red: return .red
            default: return .undefined
        }
        
    }
    
}

extension ScheduleService {
    func configurePairFrom(suaiPair: SUAIPair) -> Pair {
        
        var timeStart = suaiPair.time.stringValue()
        var timeEnd = "--:--"
        
        let regex = try! NSRegularExpression(pattern: "\\d{1,2}:\\d{2}")
        let range = NSRange(location: 0, length: timeStart.count)
        let results = regex.matches(in: timeStart, range: range).map { String(timeStart[Range($0.range, in: timeStart)!]) }
        
        if results.count >= 2 {
            timeStart = results[0]
            timeEnd = results[1]
        } else {
            timeStart = "--:--"
        }
        
        let number: Int
        if timeStart.hasPrefix("9:") { number = 1 }                 // какая то страшная конструкция (визуально)
        else if timeStart.hasPrefix("11") { number = 2 }
        else if timeStart.hasPrefix("13") { number = 3 }
        else if timeStart.hasPrefix("15") { number = 4 }
        else if timeStart.hasPrefix("16") { number = 5 }
        else if timeStart.hasPrefix("18") { number = 6 }
        else { number = 0 }                                         // на этот случай можно использовать опционал
        
        let color: WeekColor
        switch suaiPair.color {
        case .blue: color = .blue
        case .red: color = .red
        case .both: color = .bouth
        default: color = .undefined
        }
        
        return Pair(subject: suaiPair.name ?? "", type: suaiPair.lessonType ?? "", number: number, time: (timeStart, timeEnd), groups: suaiPair.groups ?? [], teachers: suaiPair.teachers ?? [], audience: suaiPair.auditory.fullDescription, week: color)
    }
    
    func configureDayFrom(suaiDay: SUAIDay, pairs: [Pair]) -> Day {
        let day = DayWeek(rawValue: Int(suaiDay.weekday - 1)) ?? DayWeek.undefined
        return Day(pairs: pairs, dayWeek: day)
    }
}

