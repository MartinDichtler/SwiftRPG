//
//  Items.swift
//  SwiftRPG
//
//  Created by Martin Dichtler on 10/11/2018.
//  Copyright © 2018 Martin Dichtler. All rights reserved.
//

import Foundation


class Items {
    struct Weapon {
        var name: String
        var DMG: Int
    }
    
    struct Trash {
        var name: String
    
    }
    
}


let firstWeapon: Items.Weapon = Items.Weapon(name: "First Weapon", DMG: 3)
let trashItem: Items.Trash = Items.Trash(name: "Garbage")
