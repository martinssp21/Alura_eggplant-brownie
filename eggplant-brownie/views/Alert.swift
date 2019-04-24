//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Rodrigo Martins on 17/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    public func show(title: String = "Sorry", message : String = " Unexpected Error"){
        let error = UIAlertController(title: title, message: message , preferredStyle: UIAlertController.Style.alert)
        error.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        self.controller.present(error, animated: true, completion: nil)
    }
    
//    public func cancelRemove(title: String = "Sorry", message : String = " Unexpected Error"){
//        let error = UIAlertController(title: title, message: message , preferredStyle: UIAlertController.Style.alert)
//
//        let cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
//        let remove = UIAlertAction(title: "Remove", style: UIAlertAction.Style.destructive, handler: removeSelected)
//
//        error.addAction(cancel)
//        error.addAction(remove)
//
//        self.controller.present(error, animated: true, completion: nil)
//    }
//
//    private func removeSelected(action: UIAlertAction){
//        print("LET'S DO IT")
//    }
    
}
