//
//  ScheduleInteractor.swift
//  SUAI first
//
//  Created by work on 27.01.2023.
//

import Foundation

protocol ScheduleInteractorProtocol: AnyObject {
    func loadScheduleFor(group: String)
    func getCurrentWeekColor() -> WeekColor
}

class ScheduleInteractor {
    weak var presenter: SchedulePresenterProtocol?
    
}

extension ScheduleInteractor: ScheduleInteractorProtocol {
    func loadScheduleFor(group: String) {
        
        ScheduleService.shared.getPairsFor(group: group) { days in
            print("ScheduleService did load schedule")
            self.presenter!.didLoadSchedule(days)
        } error: { errorString in
            print("Error in ScheduleInteractor getPairFor(group:): \(errorString)")
            // тут нужно вызвать презентер.ошибкаЗагрузкиПар
//            self.loadScheduleFor(group: group)
        }
    }
    
    func getCurrentWeekColor() -> WeekColor {
        ScheduleService.shared.getCurrentWeekColor()
    }
    
    
}
