//
//  ScheduleViewController.swift
//  SUAI first
//
//  Created by work on 23.01.2023.
//

import UIKit
import SUAI

protocol ScheduleViewProtocol: AnyObject {
    func refreshSchedule()
}

class ScheduleViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var collectionView: UICollectionView!
    
    var presenter: SchedulePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
//        tableView.sectionHeaderTopPadding = 30
        
        let nibPair = UINib(nibName: "CellPair", bundle: nil)
        tableView.register(nibPair, forCellReuseIdentifier: "CellPair")
        
        let nibDay = UINib(nibName: "CellDay", bundle: nil)
        tableView.register(nibDay, forHeaderFooterViewReuseIdentifier: "CellDay")
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let nibWeekday = UINib(nibName: "CellWeekday", bundle: nil)
        collectionView.register(nibWeekday, forCellWithReuseIdentifier: "CellWeekday")
        
        print("ScheduleViewController did load")
        presenter?.setupView()
        

    }
}

extension ScheduleViewController: ScheduleViewProtocol {
    func refreshSchedule() {
        print("ScheduleViewController will refresh schedule")
        tableView.reloadData()
        collectionView.reloadData()
    }
}
