//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Rodrigo Martins on 08/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    
    @IBOutlet weak var nameField: UITextField?
    @IBOutlet weak var happinessField: UITextField?
    @IBOutlet weak var tableView: UITableView?
    
    var delegate : AddAMealDelegate?
    
    var selected = Array<Item>()
    
    var itens = Array<Item>()
    
    
    func add(_ item: Item) {
        itens.append(item)
        Dao().saveItems(itens)
        if let table = tableView{
            table.reloadData()
        } else {
            Alert(controller: self).show(title: "Error", message: "Unanble update items list.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itens = Dao().loadItems()
        
        let newItemButton = UIBarButtonItem(title: "New Item", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showNewItem))
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    @objc func showNewItem(){
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        }
    }
    
    func convertToInt(_ text: String?) -> Int? {
        if let number = text {
            return Int(number)
        }
        return nil
    }
    
    func getMealFromForm() -> Meal? {
        if let name = nameField?.text {
            if let happiness = convertToInt(happinessField?.text){
                let meal = Meal(name: name, happiness: happiness, items: selected)
                
                //print("eaten \(meal.name) with happiness \(meal.happiness) eith \(meal.itens)!")
                return meal
            }
        }
        return nil
    }
    
    @IBAction func actionAdd(_ sender: Any) {
        if let meal = getMealFromForm() {
            if let meals = delegate{
                meals.add(meal)
                
                if let navigation = navigationController {
                    navigation.popViewController(animated: true)
                } else {
                    Alert(controller: self).show(message: "Unable to go back, but the meal was added.")
                }
            }
        }
        Alert(controller: self).show()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = self.itens[indexPath.row].name
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            //        cell!.accessoryType = cell!.accessoryType == UITableViewCell.AccessoryType.none ?
            //            UITableViewCell.AccessoryType.checkmark : UITableViewCell.AccessoryType.none
            if(cell.accessoryType == UITableViewCell.AccessoryType.none){
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                let item = itens[indexPath.row]
                selected.append(item)
            } else {
                cell.accessoryType = UITableViewCell.AccessoryType.none
                let item = itens[indexPath.row]
                if let position = selected.firstIndex(of: item){
                    selected.remove(at: position)
                } else {
                    Alert(controller: self).show()
                }
                
            }
        } else {
            Alert(controller: self).show()
        }
    }
}

