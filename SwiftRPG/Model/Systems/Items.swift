//
//  Items.swift
//  SwiftRPG
//
//  Created by Martin Dichtler on 10/11/2018.
//  Copyright © 2018 Martin Dichtler. All rights reserved.
//

import Foundation


class Items {
    
    enum ItemType {
        case Weapon
        case Trash
    }
    
    struct Item {
        var name: String
        var power: Int
        var type: ItemType
    }
    
    
    
    
    
    
    //TODO - ITEMS ARE BASED ON POWER AND WILL HAVE DIFFERENT STATS SO WE CAN REUSE ITEMS
    //CHECK CONFIGURATION FOR LIMIT OF ITEMS, DON'T ALLOW ANY ITEMS TO BE ADDED PAST THIS LIMIT
    func giveItem(item: Item) {
       
            if(myCharacter.inventory.count < Configuration().inventoryLimit) {
                myCharacter.inventory.append(item)
                
                //FOR NOW ONLY WAY TO OBTAIN ITEMS IS FROM QUESTS SO THIS IS FINE, WILL BE CHANGED IN FUTURE
                Quests().currentRewards["ItemReward"] = item
            } else {
                print("Inventory is full. Item couldn't be added and was destroyed.")
                //WE WON'T DEAL WITH QUEST IN THIS CASE AND KEEP DEFAULT ITEM AS NOTHING IS BEING ADDED
            }
        
        
    }
    
}

//USED FOR QUESTS WHICH HAVE NO REWARDS
let noReward = Items.Item(name: "Placeholder", power: 0, type: .Trash)


//DEFAULT WEAPON WHICH IS THERE IF NOTHING ELSE IS EQUIPED
let defaultWeapon = Items.Item(name: "Default", power: 1, type: .Weapon)

//TESTING ITEMS
let firstWeapon = Items.Item(name: "First Weapon", power: 3, type: .Weapon)
let trashItem = Items.Item(name: "Trash Item", power: 0, type: .Trash)
let testWeaponHighPower = Items.Item(name: "High Power", power: 1000, type: .Weapon)
