//
//  Character.swift
//  SwiftRPG
//
//  Created by Martin Dichtler on 10/11/2018.
//  Copyright © 2018 Martin Dichtler. All rights reserved.
//

import Foundation



//OUR DEFAULT CHARACTER WHICH CAN BE CHANGED AND ADJUSTED IF WE DECIDE TO ADD CLASSES IN FUTURE
var myCharacter = Character(HP: 100, DMG: 10, DEF: 3, power: 0, currency: 1000, specialCurrency: 0, energy: 30, weapon: defaultWeapon, inventory: [firstWeapon,trashItem,testWeaponHighPower])
//DISPLAYED STATS
var displayedStats = [String:Int]()
var displayedStatsLabels = [String]()


struct Character {
    
    //CHARACTER STATS
    var HP: Int
    var DMG: Int
    var DEF: Int
    
    
    //TOTAL POWER STAT
    var power: Int
    
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
        
        //ADD UP POWER FROM OUR EQUIPMENT
        let totalPower = characterReference.weapon.power
        
        characterReference.power = totalPower
        
        characterReference.DMG = characterReference.DMG + Int((Double(totalPower) * Configuration().dmgMultiplier))
        characterReference.HP = characterReference.HP + Int((Double(totalPower) *  Configuration().hpMultiplier))
        characterReference.DEF = characterReference.DEF + Int((Double(totalPower) * Configuration().defMultiplier))
        
        

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
            "DEF":  updatedCharacter.DEF,
            "Power": updatedCharacter.power
            
        ]
        //ASSIGN LABELS FOR INDIVIDUAL STATS LETTING US TO RENAME THEM
        displayedStatsLabels = [
        "HP",
        "DMG",
        "DEF",
        "Power"
        ]
        
        return statsToBeDisplayed
        
        
    }
    
    
    func equipWeapon(item: Items.Item, index: Int) {
        if(myCharacter.weapon.name != defaultWeapon.name) {
            myCharacter.inventory.remove(at: index)
            myCharacter.inventory.append(myCharacter.weapon)
            myCharacter.weapon = item
            print("Weapon was equipped and current weapon was unequipped.")
            
            
        } else {
            myCharacter.inventory.remove(at: index)
            myCharacter.weapon = item
            print("Weapon was equipped without placing default weapon to inventory")
        }
    }
    
    
    func rewardCurrency(baseReward: Int, rewardPercentage: Int) {
        print("Base Reward: \(baseReward) RewardPercentage: \(rewardPercentage)")
        let rewardMultiplier = Float(rewardPercentage) / 100.0
        let currencyToGive: Float = Float(baseReward) * rewardMultiplier
        myCharacter.currency = myCharacter.currency + Int(currencyToGive)
        print("Added \(currencyToGive) to users currency balance")
        Quests().currentRewards["currencyReward"] = currencyToGive
    }
    
    
    func rewardSpecialCurrency(baseReward: Int, specialRewardPercentage: Int) {
        let rewardMultiplier = Float(specialRewardPercentage) / 100.0
        let specialCurrencyToGive: Float = Float(baseReward) * rewardMultiplier
        myCharacter.specialCurrency = myCharacter.specialCurrency + Int(specialCurrencyToGive)
        print("Added \(specialCurrencyToGive) to users special currency balance")
        Quests().currentRewards["specialCurrencyReward"] = specialCurrencyToGive
        
    }
    
    func rewardExperience(baseReward: Int, xpRewardPercentage: Int) {
        //TODO
         Quests().currentRewards["XPReward"] = 0
    }
    

    
    
    
    
    
    
    
    
    
}



