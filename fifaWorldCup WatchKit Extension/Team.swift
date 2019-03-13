//
//  Team.swift
//  fifaWorldCup WatchKit Extension
//
//  Created by Shaishav Solanki on 2019-03-10.
//  Copyright © 2019 Shaishav Solanki. All rights reserved.
//

import WatchKit

class Team: NSObject {
    
    var teamAname:String?
    var teamBname:String?
    
    
    var teamAImage:String?
    var teamBImage:String?
    var matchdate:String?
//
    convenience override init() {
        self.init(teamAname:"", teamBname:"", teamAImage:"", teamBImage:"", matchdate:"")
    }
    
    init(teamAname:String, teamBname:String, teamAImage:String, teamBImage:String, matchdate:String) {
        self.teamAname = teamAname
        self.teamBname = teamBname
        self.teamAImage = teamAImage
        self.teamBImage = teamBImage
        self.matchdate = matchdate
//
    }

    
   
    

    
}
