//
//  ScheduleViewController+UICellViewDataSource.swift
//  SUAI first
//
//  Created by work on 06.03.2023.
//

import UIKit

extension ScheduleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.configureCellWeekdayNumberOfSection() ?? 0
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellWeekday", for: indexPath) as! CellWeekday
        presenter?.configureCellWeekday(cell, indexPath)
        return cell
    }
}


extension ScheduleViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectRowAt")
        if let cell = collectionView.cellForItem(at: indexPath) as? CellWeekday {
            presenter?.configureCellWeekdayColor(cell, indexPath)
        }
        
        let index = IndexPath(item: 0, section: indexPath.row)
        
        //
        tableView.scrollToRow(at: index, at: .top, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("didDeselectItemAt")
        if let cell = collectionView.cellForItem(at: indexPath) as? CellWeekday {
            presenter?.configureCellWeekdayColor(cell, indexPath)
        }
    }
}
