//
//  ViewController.swift
//  SUAI first
//
//  Created by work on 07.01.2023.
//

import UIKit
import SUAI

class TabBarController: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("TabBarController did load")
//        SUAI.instance()
        
//        while (!SUAI.instance().isReachable) {}
        
        
        viewControllers?[0] = ScheduleBuilder.buildModule()
        
//        selectedViewController = ScheduleBuilder.buildModule()
    }
    
    @objc func didTapButton() {
        print("vc didTapButton")
        self.present(ScheduleBuilder.buildModule(), animated: true)

    }
}
