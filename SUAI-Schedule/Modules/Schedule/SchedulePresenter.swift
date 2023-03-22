//
//  SchedulePresenter.swift
//  SUAI first
//
//  Created by work on 27.01.2023.
//

import Foundation
import SUAI

protocol SchedulePresenterProtocol: AnyObject {
    
    // возможно, следует переписать протокол и отправлять в делегат метод configure с цветом UIColor вместе Bool
    func setupView()
    func didLoadSchedule(_ schedule: [Day])
    func configureCellPairNumberOfSection() -> Int
    func configureCellPairNumberOfRowsInSection(_ section: Int) -> Int
    func configureCellPair(_ cell: CellPair, _ indexPath: IndexPath)
    
    func configureCellWeekdayNumberOfSection() -> Int
    func configureCellWeekday(_ cell: CellWeekday, _ indexPath: IndexPath)
    func configureCellWeekdayColor(_ cell: CellWeekday, _ indexPath: IndexPath)

    func configureHeaderCellDay(_ cell: CellDay, _ section: Int)

}

class SchedulePresenter {
    private weak var view: ScheduleViewProtocol?
    private var interactor: ScheduleInteractorProtocol
    private var router: ScheduleRouterProtocol

    
    
    init(view: ScheduleViewProtocol, interactor: ScheduleInteractorProtocol, router: ScheduleRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    private var schedule: [Day]?
    private var currentWeekColor: WeekColor = .blue
    
    private var scheduleBlueList = [Day]()
    private var scheduleRedList = [Day]()
    
//    private var dateList = [Date]()
    private var startOfWeek = Date()
    private var countWeekdays = 14
    
}

extension SchedulePresenter: SchedulePresenterProtocol {
    
    func configureCellWeekdayColor(_ cell: CellWeekday, _ indexPath: IndexPath) {
        let weekday = Calendar.current.date(byAdding: .weekday, value: indexPath.row, to: startOfWeek) ?? startOfWeek
        let weekdayStr = Calendar.current.shortWeekdaySymbols[Calendar.current.component(.weekday, from: weekday) - 1]
        let dayNumberStr = String(Calendar.current.component(.day, from: weekday))
        
        if indexPath.row < 7 {
            cell.setBackground(isBlueWeek: true)
        } else {
            cell.setBackground(isBlueWeek: false)
        }
    }
    
    func configureHeaderCellDay(_ cell: CellDay, _ section: Int) {
        if section < scheduleBlueList.count {
            cell.configure(day: scheduleBlueList[section].dayWeek.getString(), isBlueWeek: true)
        } else {
            cell.configure(day: scheduleBlueList[section - scheduleBlueList.count].dayWeek.getString(), isBlueWeek: false)
        }
    }
    
    
    func configureCellWeekdayNumberOfSection() -> Int {
        countWeekdays
    }
    
    
    func configureCellWeekday(_ cell: CellWeekday, _ indexPath: IndexPath) {
        let weekday = Calendar.current.date(byAdding: .weekday, value: indexPath.row, to: startOfWeek) ?? startOfWeek
        let weekdayStr = Calendar.current.shortWeekdaySymbols[Calendar.current.component(.weekday, from: weekday) - 1]
        let dayNumberStr = String(Calendar.current.component(.day, from: weekday))
        
        if indexPath.row < 7 {
            cell.configure(top: weekdayStr, bottom: dayNumberStr, isSelected: false, isSunday: false, isFree: false)
        } else {
            cell.configure(top: weekdayStr, bottom: dayNumberStr, isSelected: false, isSunday: true, isFree: false)
        }
    }
    
    
    func configureCellPairNumberOfSection() -> Int {
        scheduleBlueList.count + scheduleRedList.count
    }
    
    func configureCellPairNumberOfRowsInSection(_ section: Int) -> Int {        // подумать и нормально сделать
        if currentWeekColor == .blue {
            if section < scheduleBlueList.count { return scheduleBlueList[section].pairs.count }
            return scheduleRedList[section - scheduleBlueList.count].pairs.count
        }
        if section < scheduleRedList.count { return scheduleRedList[section].pairs.count }
        return scheduleBlueList[section - scheduleRedList.count].pairs.count
    }
    
    func configureCellPair(_ cell: CellPair, _ indexPath: IndexPath) {
        if indexPath.section < scheduleBlueList.count {
            let pair = scheduleBlueList[indexPath.section].pairs[indexPath.item]
            cell.configure(start: pair.time.start,
                           end: pair.time.end,
                           subject: pair.subject,
                           group: pair.groups.getGroupsString(),
                           audience: pair.audience,
                           teacher: pair.teachers.getTeachersString(),
                           isFirst: indexPath.item == 0,
                           isLast: indexPath.item == scheduleBlueList[indexPath.section].pairs.count - 1)
            cell.configureColor(isBlueWeek: true, isPassed: true)
        } else {
            let pair = scheduleRedList[indexPath.section - scheduleBlueList.count].pairs[indexPath.item]
            cell.configure(start: pair.time.start,
                           end: pair.time.end,
                           subject: pair.subject,
                           group: pair.groups.getGroupsString(),
                           audience: pair.audience,
                           teacher: pair.teachers.getTeachersString(),
                           isFirst: indexPath.item == 0,
                           isLast: indexPath.item == scheduleRedList[indexPath.section - scheduleBlueList.count].pairs.count - 1)
            cell.configureColor(isBlueWeek: false, isPassed: true)
        }
        
    }
    
    func didLoadSchedule(_ schedule: [Day]) {
        self.schedule = schedule
        
        schedule.forEach { day in
            if day.dayWeek == .undefined {
                scheduleBlueList.append(day)
                scheduleRedList.append(day)
            } else {
                scheduleBlueList.append(Day(pairs: day.getBluePairs(), dayWeek: day.dayWeek))
                scheduleRedList.append(Day(pairs: day.getRedPairs(), dayWeek: day.dayWeek))
            }
        }
        
//        scheduleRedList.sort { $0.dayWeek < $1.dayWeek }
        
        // нужно как то хранить даты (две недели) для скрол списка сверху
        // по значению даты определять день недели и ЦВЕТ НЕДЕЛИ
        
//        var shift = Calendar.current.component(.weekday, from: d01092022) - 2
//        (Calendar.current.dateComponents([.day], from: /Дата 1 сентбря этого учебного года, to: /дата).day! + shift)
//        ((Calendar.current.dateComponents([.day], from: /Дата 1 сентбря этого учебного года, to: /дата).day! + shift) / 7 + 1 ) % 2  четная нечетная
        
        
        // начало недели (добавить "если сегодня воскресенье, то "начало недели" - 1 день)
//        let today = DateComponents(calendar: .current, year: 2023, month: 1, day: 1).date!
        startOfWeek = Calendar.current.nextWeekend(startingAfter: Date(), direction: .backward)?.end ?? Date()
        if Calendar.current.component(.weekday, from: Date()) == 1 {
            startOfWeek = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: startOfWeek) ?? Date()
        }
        
        
        
        print("SchedulePresenter will update schedule")
        view!.refreshSchedule()
    }
    
    func setupView() {
        print("SchedulePresenter will setup view")
        interactor.loadScheduleFor(group: "4032")
    }
}
    
    
    

