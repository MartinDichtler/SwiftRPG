//
//  Character.swift
//  SwiftRPG
//
//  Created by Martin Dichtler on 10/11/2018.
//  Copyright © 2018 Martin Dichtler. All rights reserved.
//

import Foundation


//OUR DEFAULT CHARACTER WHICH CAN BE CHANGED AND ADJUSTED IF WE DECIDE TO ADD CLASSES IN FUTURE
var myCharacter = Character(HP: 100, DMG: 10, DEF: 3, currency: 1000, specialCurrency: 0, energy: 30, weapon: defaultWeapon, inventory: [firstWeapon,trashItem])
//DISPLAYED STATS
var displayedStats = [String:Int]()
var displayedStatsLabels = [String]()


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
    var weapon: Items.Item
    
    //RULE FOR INVENTORY IS THAT WE USE STRUCTS ONLY
    var inventory: [Items.Item]
    
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
    
    func prepareStatsToBeDisplayed() -> [String: Int] {
        
        //CALCULATE STATS WHICH INCLUDE EQUIPMENT
        let updatedCharacter = calculateStats()
        
        
        
        //AMOUNT OF STATS HERE HAS TO MATCH AMOUNT OF STATS IN OUR CONFIGURATION.SWIFT
        //REUSE UPDATECHARACTER WHICH HAS THE MOST CURRENT STATS INCLUDING STATS FROM EQUIPMENT
        let statsToBeDisplayed = [
            "HP" :  updatedCharacter.HP,
            "DMG":  updatedCharacter.DMG,
            "DEF":  updatedCharacter.DEF
            
        ]
        //ASSIGN LABELS FOR INDIVIDUAL STATS LETTING US TO RENAME THEM
        displayedStatsLabels = [
        "HP",
        "DMG",
        "DEF"
        ]
        
        return statsToBeDisplayed
        
        
    }
    

    
    
    
    
    
    
    
    
    
}



