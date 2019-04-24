//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Rodrigo Martins on 08/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import Foundation

class Meal: NSObject, NSCoding {
    let name:String
    let happiness:Int
    let itens: Array<Item>
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(happiness, forKey: "happiness")
        aCoder.encode(itens, forKey: "items")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.happiness = aDecoder.decodeInteger(forKey: "happiness")
        self.itens = aDecoder.decodeObject(forKey: "items") as! Array
    }
    
    init(name:String, happiness:Int, items: Array<Item> = []) {
        self.name = name
        self.happiness = happiness
        self.itens = items
    }
    
    func allCalories() -> Double {
        var total:Double = 0
        for item in itens {
            total += item.calories
        }
        return total
    }
    
    func details() -> String{
        var message = "Happiness: \(happiness)"
        for item in itens {
            message += item.details()
        }
        message += "\n Calories Sum: \(allCalories())"
        return message
    }
}
