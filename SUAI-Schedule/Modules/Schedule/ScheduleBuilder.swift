//
//  ScheduleBuilder.swift
//  SUAI first
//
//  Created by work on 27.01.2023.
//

import Foundation
import UIKit

class ScheduleBuilder {
    static func buildModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "ScheduleView", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ScheduleView") as! ScheduleViewController
        
        let interactor = ScheduleInteractor()
        let router = ScheduleRouter()
        let presenter = SchedulePresenter(view: vc, interactor: interactor, router: router)
        
        interactor.presenter = presenter
        router.presenter = presenter
        vc.presenter = presenter
        
        print("ScheduleBuilder did build Schedule Module")
        return vc
    }
}
