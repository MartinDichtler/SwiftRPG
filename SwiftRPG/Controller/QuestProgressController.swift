//
//  QuestProgressController.swift
//  SwiftRPG
//
//  Created by Martin Dichtler on 18/11/2018.
//  Copyright © 2018 Martin Dichtler. All rights reserved.
//

import UIKit

var acceptedQuest: Quest?

class QuestProgressController: UIViewController {
    @IBOutlet weak var timerProgress: UIProgressView!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ONCE AGAIN IN CASE OF SOME ERRORS WE WANT TO HANDLE IT BY REASSIGNING DIFFERENT QUEST THIS IS LIKELY TO BE CHANGED IN FUTURE
        questStarted(quest: acceptedQuest ?? Quests().assignQuest())
        
    }
    
    
    //OUR QUEST WILL START, IF WE DON'T NEED COUNTDOWN TILL THE END WILL USE DISPATCH QUEUE METHOD TO FIRE ONLY ONCE
    func questStarted(quest: Quest) {
        //BECAUSE DISPATCH QUEUE REQUIRES DOUBLE WILL CAST OUR DURATION TO DOUBLE
        let durationOfTimerInSeconds = Double(quest.DurationInSeconds)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationOfTimerInSeconds) {
            Quests().completeQuest(quest: quest)
            print("Quest has been completed.")
        }
    }
    

    

}
