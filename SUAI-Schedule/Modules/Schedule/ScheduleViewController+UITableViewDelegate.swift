//
//  ScheduleViewController+UITableViewDelegate.swift
//  SUAI first
//
//  Created by work on 29.01.2023.
//

import UIKit
//import SUAI

extension ScheduleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        print("configure viewForHeaderInSection")
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CellDay") as! CellDay

        

//        var dayString: String
//
//        if (section < presenter!.countBlueDay()) {
//            dayString = (presenter?.getDayName(blueDay: section) ?? "nil") + " BLUE"
//        } else {
//            dayString = (presenter?.getDayName(redDay: section) ?? "nil") + " RED"
//        }
//
//        header.configure(day: "dayString")
        
        presenter?.configureHeaderCellDay(header, section)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        print("configure height for header")
        return 16+20
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }
}

