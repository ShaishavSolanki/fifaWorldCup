//
//  InterfaceController.swift
//  fifaWorldCup WatchKit Extension
//
//  Created by Shaishav Solanki on 2019-03-07.
//  Copyright © 2019 Shaishav Solanki. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    
    
    @IBOutlet weak var scheduleTable: WKInterfaceTable!
    
    
    var scheduleClass = ScheduleRowController()
    //creating teams
    var teamList:[Team] = []
    
     let countryFlagList = ["003-india","002-canada","001-brazil","004-united-states","005-vietnam"]
    func scheduledGames() {
        let s1 = Team(teamAname:"Canada", teamBname:"India", teamAImage:"002-canada", teamBImage:"003-india")
        let s2 = Team(teamAname:"Brazil",teamBname:"Vietnam",  teamAImage:"001-brazil", teamBImage:"005-vietnam")
        let s3 = Team(teamAname:"U.S",teamBname:"India", teamAImage:"004-united-states", teamBImage:"003-india")
        let s4 = Team(teamAname:"Canada",teamBname:"Vietnam", teamAImage:"002-canada", teamBImage:"005-vietnam")
        let s5 = Team(teamAname:"U.S",teamBname:"Brazil", teamAImage:"004-united-states", teamBImage:"001-brazil")
        
        teamList.append(s1)
        teamList.append(s2)
        teamList.append(s3)
        teamList.append(s4)
        teamList.append(s5)
       
        
       
    }
 
   

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    
        super.willActivate()
        
        
        self.scheduledGames()
       // if(self.scheduleTable != nil){
        self.scheduleTable?.setNumberOfRows(self.teamList.count, withRowType:"scheduleRow")
        //}
       // else{
        //    print("Error getting the value")
       // }
        
        

        for (i, g) in self.teamList.enumerated(){
            let row = self.scheduleTable?.rowController(at: i) as? ScheduleRowController

            row?.TeamALabel.setText(g.teamAname!)
            row?.TeamBLabel.setText(g.teamBname!)
            row?.teamAImageView.setImage(UIImage(named: g.teamAImage!))
            row?.teamBImageView.setImage(UIImage(named: g.teamBImage!))
//
        }
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
