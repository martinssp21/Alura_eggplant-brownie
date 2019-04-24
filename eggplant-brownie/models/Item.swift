//
//  Item.swift
//  eggplant-brownie
//
//  Created by Rodrigo Martins on 08/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding {
    let name:String
    let calories:Double
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(calories, forKey: "calories")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.calories = aDecoder.decodeDouble(forKey: "calories")
    }
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories;
    }
    
    func details() -> String{
        return "\n \(name) - calories: \(calories)"
    }
    
}

func ==(first: Item, second: Item) -> Bool{
    return first.name == second.name && first.calories == second.calories
}
