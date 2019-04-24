//
//  RemoveMealController.swift
//  eggplant-brownie
//
//  Created by Rodrigo Martins on 17/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealController{
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(_ meal: Meal, handler: @escaping (UIAlertAction) -> Void ){
        
        let error = UIAlertController(title: "\(meal.name)", message: "\(meal.details())" , preferredStyle: UIAlertController.Style.alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        let remove = UIAlertAction(title: "Remove", style: UIAlertAction.Style.destructive, handler: handler)
        
        error.addAction(cancel)
        error.addAction(remove)
        
        self.controller.present(error, animated: true, completion: nil)
    
    }
}
