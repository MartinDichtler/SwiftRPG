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
    
}
