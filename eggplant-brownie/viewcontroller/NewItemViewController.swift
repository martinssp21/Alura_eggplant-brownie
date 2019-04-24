//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Rodrigo Martins on 16/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField?
    @IBOutlet weak var caloriesField: UITextField?
    
    var delegate:AddAnItemDelegate?
    
    init(delegate: AddAnItemDelegate) {
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func addNewItem(_ sender: Any) {
        let name = nameField!.text
        let calorie = Double((caloriesField!.text)!)
        if(name == nil || calorie == nil || delegate == nil) {
            return
        }
        
        let item = Item(name: name!, calories: calorie!)
        delegate!.add(item)
        
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }

}
