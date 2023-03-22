//
//  Day.swift
//  SUAI first
//
//  Created by work on 29.01.2023.
//

import Foundation

struct Day {
    var pairs: [Pair]
    let dayWeek: DayWeek                                    // а так можно делать??
    
    func getBluePairs() -> [Pair] {
        pairs.filter {
            $0.week == .blue || $0.week == .bouth
        }
    }
    
    func getRedPairs() -> [Pair] {
        pairs.filter {
            $0.week == .red || $0.week == .bouth
        }
    }
}





