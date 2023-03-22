//
//  ScheduleRouter.swift
//  SUAI first
//
//  Created by work on 27.01.2023.
//

import Foundation

protocol ScheduleRouterProtocol: AnyObject {
    // открыть параметры (группа аудитория препод)
    
}

class ScheduleRouter {
    weak var presenter: SchedulePresenterProtocol?
}

extension ScheduleRouter: ScheduleRouterProtocol {
    
}
