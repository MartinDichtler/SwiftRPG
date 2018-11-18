//
//  Configuration.swift
//  SwiftRPG
//
//  Created by Martin Dichtler on 10/11/2018.
//  Copyright © 2018 Martin Dichtler. All rights reserved.
//

import Foundation







class Configuration {
    
    //AMOUNT OF ITEMS THAT CAN BE IN OUR INVENTORY
    let inventoryLimit = 6
    
    //AMOUNT OF DIFFERENT STATS THAT ARE DISPLAYED ON CHARACTER SCREEN
    let amountOfStatsPerCharacter = 4
    
    
    //POWER MULTIPLIERS
    //ALL ITEMS HAVE POWER AS THEIR ONLY STATS, OTHER STATS ARE CALCULATED USING MULTIPLIES TO POWER VALUE
    let dmgMultiplier = 1.5
    let hpMultiplier = 2.5
    let defMultiplier = 1.2
    
    
    //quest reward multiplier default 100
    let questRewardMultiplier = 100
}


class QuestsData {
    var data: [Quest] = [
        Quest(title: "First quest", description: "This is example text for quest", XPRewardPercentage: 90, CurrencyRewardPercentage: 100, SpecialCurrencyRewardPercentage: 5, Item: noReward, DurationInSeconds: 10),
        Quest(title: "Second quest", description: "This is example text for quest", XPRewardPercentage: 90, CurrencyRewardPercentage: 5, SpecialCurrencyRewardPercentage: 5, Item: noReward, DurationInSeconds: 10),
        Quest(title: "Third quest", description: "This is example text for quest", XPRewardPercentage: 90, CurrencyRewardPercentage: 5, SpecialCurrencyRewardPercentage: 5, Item: noReward, DurationInSeconds: 10),
        Quest(title: "Fourth quest", description: "This is example text for quest", XPRewardPercentage: 90, CurrencyRewardPercentage: 5, SpecialCurrencyRewardPercentage: 5, Item: noReward, DurationInSeconds: 10)
    
    
    
    
    
    
    
    ]
}
