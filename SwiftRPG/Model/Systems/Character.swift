//
//  Character.swift
//  SwiftRPG
//
//  Created by Martin Dichtler on 10/11/2018.
//  Copyright © 2018 Martin Dichtler. All rights reserved.
//

import Foundation


struct Character {
    
    //CHARACTER STATS
    var HP: Int
    var DMG: Int
    var DEF: Int
    
    //GAME STATS
    //**********
    
    //MAIN CURRENCY SUCH AS GOLD
    var currency: Int
    
    //SPECIAL CURRENCY SUCH AS DIAMONDS WHICH TRANSLATES TO REAL MONEY?
    var specialCurrency: Int
    
    //STAT THAT IS USED WITH USER ACTIONS, ONCE DEPLETED USER CANNOT PLAY OR HAS TO SPEND SPECIAL CURRENCY
    var energy: Int
    
    
    //EQUIPMENT
    
    //WEAPON
    var weapon: Items.Weapon
    
    //RULE FOR INVENTORY IS THAT WE USE STRUCTS ONLY
    var inventory: [Any]
    
}

class CharacterHandlers {
    
    
    

    
    
    
    
    
    
    
    
    
}
