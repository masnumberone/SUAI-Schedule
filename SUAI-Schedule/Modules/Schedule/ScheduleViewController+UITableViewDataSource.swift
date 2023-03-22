//
//  ScheduleViewController+UITableViewDataSource.swift
//  SUAI first
//
//  Created by work on 29.01.2023.
//

import UIKit

extension ScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("configure numberOfRowsInSection")
        return presenter?.configureCellPairNumberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("configure cellForRowAt")
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellPair", for: indexPath) as! CellPair
        presenter?.configureCellPair(cell, indexPath)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("configure numberOfSections")
        return presenter?.configureCellPairNumberOfSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}
