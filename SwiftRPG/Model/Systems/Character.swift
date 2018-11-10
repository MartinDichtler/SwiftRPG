//
//  Character.swift
//  SwiftRPG
//
//  Created by Martin Dichtler on 10/11/2018.
//  Copyright © 2018 Martin Dichtler. All rights reserved.
//

import Foundation


//OUR DEFAULT CHARACTER WHICH CAN BE CHANGED AND ADJUSTED IF WE DECIDE TO ADD CLASSES IN FUTURE
let myCharacter = Character(HP: 100, DMG: 10, DEF: 3, currency: 1000, specialCurrency: 0, energy: 30, weapon: firstWeapon, inventory: [firstWeapon,trashItem])

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
    
    
    //BEFORE DISPLAYING CHARACTER AND IT'S STATS WE WANT TO CALCULATE THE AMOUNT OF STATS WHICH IS ADDED BY OUR EQUIPMENT
    func calculateStats() -> Character {
        
        //CREATE CHARACTER REFERENCE WHICH IS REFERENCING OUR CURRENT CHARACTER
        var characterReference = myCharacter
        
        //CALCULATE DMG STAT WHICH IS OUR CHARACTERS BASE STAT + EQUIPMENT DMG STATS
        characterReference.DMG = characterReference.DMG + myCharacter.weapon.DMG

        return characterReference
        
    }
    

    
    
    
    
    
    
    
    
    
}
