//
//  Quests.swift
//  SwiftRPG
//
//  Created by Martin Dichtler on 18/11/2018.
//  Copyright © 2018 Martin Dichtler. All rights reserved.
//

import Foundation




struct Quest {
    var title: String
    var description: String
    var XPRewardPercentage: Int
    var CurrencyRewardPercentage: Int
    var SpecialCurrencyRewardPercentage: Int
    var Item: Items.Item
    var DurationInSeconds: Int
}


class Quests {
    
    //WE USE CURRENT REWARDS TO DISPLAY REWARD AFTER QUEST IS FINISHED
    var currentRewards = ["currencyReward": 0, "specialCurrencyReward": 0, "XPReward": 0, "ItemReward": noReward] as [String : Any]
    
    
    
    //ASSIGN QUEST IS CALLED TO DETERMINE WHICH WILL BE THE NEXT QUEST WHEN USER TRIES TO ACCEPT IT
    func assignQuest() -> Quest {
        let assignedQuestIndex = randomNumber(total: QuestsData().data.count)
        let assignedQuest = QuestsData().data[assignedQuestIndex]
        return assignedQuest
    }
    
    
    
    //CONDITIONS AND CALCULATIONS FOR COMPLETING QUEST
    func completeQuest(quest: Quest) {
        //MAKE SURE THAT OUR REWARD COUNTER IS RESET
        currentRewards = ["currencyReward": 0, "specialCurrencyReward": 0, "XPReward": 0, "ItemReward": noReward]
        
        if(quest.Item.name == noReward.name) {
            print("This quest has no item reward.")
        } else {
            print("This quest had reward, adding to inventory.")
            Items().giveItem(item: quest.Item)
        }
        
        //RECALCULATE STATS INCLUDING EQUIPMENT AND CREATE REWARD BASED ON THAT
        let baseReward = calculateRewards(power: CharacterHandlers().calculateStats().power)
        
        print(baseReward)
            //ADD BASE CURRENCY
        CharacterHandlers().rewardCurrency(baseReward: baseReward, rewardPercentage: quest.CurrencyRewardPercentage)
        
            //ADD SPECIAL CURRENCY
        CharacterHandlers().rewardSpecialCurrency(baseReward: baseReward, specialRewardPercentage: quest.CurrencyRewardPercentage)
        
            //ADD XP - TODO ADD FUNCTIONALITY
        CharacterHandlers().rewardExperience(baseReward: baseReward, xpRewardPercentage: quest.XPRewardPercentage)
        
        
        
        
    }
    
    
    
    //EDIT THIS FUNCTION TO CHANGE REWARD SCHEME FOR XP
    func calculateRewards(power: Int) -> Int {
        let baseReward = power * Configuration().questRewardMultiplier
        return baseReward
    }
    
    
    //HELPER REUSE FUNCTION TO GET RANDOM NUMBER
    func randomNumber(total: Int) -> Int {
        return Int.random(in: 0 ... total - 1)
    }
    
}
