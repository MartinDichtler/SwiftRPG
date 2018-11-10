//
//  ViewController.swift
//  SwiftRPG
//
//  Created by Martin Dichtler on 10/11/2018.
//  Copyright © 2018 Martin Dichtler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var characterOutput: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //HERE WE OUTPUT ALREADY CALCULATED CHARACTER FOR EXAMPLE TO DISPLAY ON CHARACTER SCREEN
        characterOutput.text =  "\(CharacterHandlers().calculateStats())"
        
        
        

    }


}

