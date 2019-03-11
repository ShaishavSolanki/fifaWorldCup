//
//  ViewController.swift
//  fifaWorldCup
//
//  Created by Shaishav Solanki on 2019-03-07.
//  Copyright © 2019 Shaishav Solanki. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
   
   
    var teamList:[Team] = []
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleRow", for: indexPath)

        
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.scheduledGames()
        for (i, g) in self.teamList.enumerated(){
            let row = self.scheduleTable?.rowController(at: i) as? ScheduleRowController
            
            row?.TeamALabel.setText(g.teamAname!)
            row?.TeamBLabel.setText(g.teamBname!)
            row?.teamAImageView.setImage(UIImage(named: g.teamAImage!))
            row?.teamBImageView.setImage(UIImage(named: g.teamBImage!))
            //
        }
        
    }

    
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
    

}

