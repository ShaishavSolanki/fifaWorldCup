//
//  SubscribedInterfaceController.swift
//  fifaWorldCup WatchKit Extension
//
//  Created by MacStudent on 2019-03-13.
//  Copyright © 2019 Shaishav Solanki. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class SubscribedInterfaceController: WKInterfaceController,WCSessionDelegate {
    
     let sharedPreferences = UserDefaults.standard
     var watchData = [String:[String]]()
     var flag = 0
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    
    func session(_ session: WCSession, didReceiveMessage sharedPreferencesFirstTeam: [String : Any]) {
        // Play a "click" sound when you get the message
        WKInterfaceDevice().play(.click)
        
        // output a debug message to the terminal
       // print("Got a message! \(sharedPreferencesFirstTeam)")
        
        
        watchData = sharedPreferencesFirstTeam["watchData"] as! [String : [String]]
        flag = 1
    
        var flagTeam1:[String] = watchData["flagFirstTeam"] as! [String]
        var flagTeam2:[String] = watchData["flagSecondTeam"] as! [String]
        var team1:[String] = watchData["firstTeam"] as! [String]
        var team2:[String] = watchData["secondTeam"] as! [String]
        var date:[String] = watchData["date"] as! [String]
        var time:[String] = watchData["time"] as! [String]
        
     self.SubscribedGameTable?.setNumberOfRows(team1.count, withRowType:"subscribedGamesRow")
        
       // print("watchdata \(watchData.count)")

        for i in 0..<team1.count{
            // self.tableView setNumberOfRows:[menuItems count] withRowType:@"MenuRowController"];
            let row = self.SubscribedGameTable?.rowController(at: i) as? SubscribedGameRowController
            
            row?.SubscribedTeamAName.setText(team1[i])
            row?.SubscribedTeamBName.setText(team2[i])
            row?.SubscribedTeamAImage.setImage(UIImage(named: flagTeam1[i]))
           row?.SubscribedTeamBImage.setImage(UIImage(named: flagTeam2[i]))
            
        }

        
    }
    

  
    @IBOutlet weak var SubscribedGameTable: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        
        print(watchData)
        
        
        
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    
}
