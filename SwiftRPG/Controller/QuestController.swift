//
//  QuestController.swift
//  SwiftRPG
//
//  Created by Martin Dichtler on 17/11/2018.
//  Copyright © 2018 Martin Dichtler. All rights reserved.
//

import UIKit

class QuestController: UIViewController {

    @IBOutlet weak var questView: UIView!
    @IBOutlet weak var questDescriptionLabel: UILabel!
    @IBOutlet weak var questTitleLabel: UILabel!
    @IBOutlet weak var questGiverImage: UIImageView!
    @IBOutlet weak var questGiverClickableArea: UIButton!
    
    var pickedQuest: Quest?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickedQuest = Quests().assignQuest()
    }
    
    @IBAction func questGiverTapped(_ sender: Any) {
        
        //IF FOR SOME REASON QUEST WASN'T ASSIGNED WITH THE LOAD WE WANT TO ASSIGN QUEST ANYWAYS TO AVOID CRASHES
        displayQuest(currentQuest: pickedQuest ?? Quests().assignQuest())
    }
    
    func displayQuest(currentQuest: Quest) {
        questView.isHidden = false
        questTitleLabel.text = currentQuest.title
        questDescriptionLabel.text = currentQuest.description
    }
    
    @IBAction func acceptQuest(_ sender: Any) {
        acceptedQuest = pickedQuest
        questView.isHidden = true
        performSegue(withIdentifier: "questAccepted", sender: self)
    }
    
}
