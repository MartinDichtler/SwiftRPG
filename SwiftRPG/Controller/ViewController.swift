//
//  ViewController.swift
//  SwiftRPG
//
//  Created by Martin Dichtler on 10/11/2018.
//  Copyright © 2018 Martin Dichtler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let myCharacter = Character(HP: 100, DMG: 10, DEF: 3, currency: 1000, specialCurrency: 0, energy: 30, weapon: firstWeapon, inventory: [firstWeapon,trashItem])
        print(myCharacter)
    }


}

