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
        var DMG: Int
        var type: ItemType
    }
    
    
    
    
    
    
    //CHECK CONFIGURATION FOR LIMIT OF ITEMS, DON'T ALLOW ANY ITEMS TO BE ADDED PAST THIS LIMIT
    func giveItem(item: Item) {
        if(myCharacter.inventory.count < Configuration().inventoryLimit) {
            myCharacter.inventory.append(item)
        } else {
            print("Inventory is full. Item couldn't be added and was destroyed.")
        }
    }
    
}

//DEFAULT WEAPON WHICH IS THERE IF NOTHING ELSE IS EQUIPED
let defaultWeapon = Items.Item(name: "Default", DMG: 0, type: .Weapon)

//TESTING ITEMS
let firstWeapon = Items.Item(name: "First Weapon", DMG: 3, type: .Weapon)
let trashItem = Items.Item(name: "Trash Item", DMG: 0, type: .Trash)
