//
//  Dao.swift
//  eggplant-brownie
//
//  Created by Rodrigo Martins on 17/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import Foundation

class Dao {
    let mealsArchive: URL
    let itemsArchive: URL
    
    init() {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        mealsArchive = paths[0].appendingPathComponent("meals_info.dados")
        itemsArchive = paths[0].appendingPathComponent("items_info.dados")
    }
    
    func saveMeals(_ meals: Array<Meal>){
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
            try data.write(to: mealsArchive)
        } catch {
            print("Couldn't write file")
        }
    }
    
    func loadMeals() -> Array<Meal> {
        do {
            let data = try Data(contentsOf: mealsArchive)
            if let meals = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Meal> {
                return meals
            }
        } catch {
            print("Couldn't read file.")
        }
        return []
    }
    
    func saveItems(_ items: Array<Item>) {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            try data.write(to: itemsArchive)
        } catch {
            print("Couldn't write file")
        }
    }
    
    func loadItems() -> Array<Item> {
        do {
            let data = try Data(contentsOf: itemsArchive)
            if let items = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Item> {
                return items
            }
        } catch {
            print("Couldn't read file.")
        }
        return []
    }
}
