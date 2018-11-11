//
//  ViewController.swift
//  SwiftRPG
//
//  Created by Martin Dichtler on 10/11/2018.
//  Copyright © 2018 Martin Dichtler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        
        

    }
    
    
    func reloadView() {
        tableView.reloadData()
        collectionView.reloadData()
        
    }


}


//INVENTORY CELLS
extension ViewController:  UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //GET AMOUNT OF CELLS IN INVENTORY (LIMIT TO BE CHANGED IN CONFIGURATION.SWIFT
        return myCharacter.inventory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //CREATE CELL OF TYPE INVENTORYCELL
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! InventoryCell
        
        //CREATE ITEM REFERENCE
        let item = myCharacter.inventory[indexPath.row]
        
        //ASSIGN ITEMS TO OUTLETS IN OUR CELL
        cell.itemLabel.text = item.name
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //RESPONDING TO INPUT TO VARIUS ITEMS BY THEIR TYPE
        let inventoryRef = myCharacter.inventory
        print("Input in inventory field.")
        if(inventoryRef[indexPath.row].type == .Weapon) {
            print("Selected item is weapon")
            CharacterHandlers().equipWeapon(item: inventoryRef[indexPath.row], index: indexPath.row)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.reloadView()
                
            }
        }
    }
}



//STAT CELLS
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //WE RETURN AMOUNT OF STATS CAN BE CHANGED IN CONFIGURATION.SWIFT
        displayedStats = CharacterHandlers().prepareStatsToBeDisplayed()
        return Configuration().amountOfStatsPerCharacter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //CREATE CUSTOM CELL
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StatCell
        
        //REFERENCE TO OUR LABELS WHICH HELP US REFERENCE DIFFERENT STATS
        let item = displayedStatsLabels[indexPath.row]
        
        //DISPLAY STATS
        cell.statName.text = item
        cell.statCount.text = "\(displayedStats[item] ?? -1)"
        return cell
    }
    
    
}

