//
//  TableViewController.swift
//  eggplant-brownie
//
//  Created by Rodrigo Martins on 08/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, AddAMealDelegate {
    
    var meals = Array<Meal>()
    
    func add(_ meal: Meal) {
        self.meals.append(meal)
        tableView.reloadData()
        Dao().saveMeals(self.meals)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.meals = Dao().loadMeals()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueAddMeal" {
            let view: ViewController = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meals[indexPath.row].name
        
        let longPressRecongnizer = UILongPressGestureRecognizer(target: self, action: #selector(showDetailsCell))
        cell.addGestureRecognizer(longPressRecongnizer)
        
        return cell
    }
    
    @objc func showDetailsCell(recognizer : UILongPressGestureRecognizer){
        if(recognizer.state == UILongPressGestureRecognizer.State.began){
            let cell = recognizer.view as! UITableViewCell
            
            if let indexPath = tableView.indexPath(for: cell){
                let row = indexPath.row
                let meal = meals[row]
                RemoveMealController(controller: self).show(meal, handler: {action in
                    self.meals.remove(at: row)
                    self.tableView.reloadData()
                })
            }
        }
    }
}
