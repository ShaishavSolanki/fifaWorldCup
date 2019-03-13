//
//  ViewController.swift
//  fifaWorldCup
//
//  Created by Shaishav Solanki on 2019-03-07.
//  Copyright © 2019 Shaishav Solanki. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
  

    @IBOutlet weak var tableView: UITableView!
    
    let sharedPreferences = UserDefaults.standard
    var flagFirstTeam = ["002-canada", "001-brazil", "004-united-states", "002-canada", "004-united-states"]
    var flagSecondTeam = ["003-india", "005-vietnam", "003-india", "005-vietnam", "001-brazil"]
    var firstTeam = ["Canada", "Brazil", "U.S", "Canada", "U.S"]
    var secondTeam = ["India", "Vietnam", "India", "Vietnam", "Brazil"]
    var time = ["07:00 AM", "11:00 AM", "03:00 PM", "06:00 PM", "09:00 PM"]
    var date = ["March 11, 2019", "March 11, 2019", "March 12, 2019", "March 12, 2019", "March 13, 2019"]
    
    var subscribed = ["no", "no", "no", "no", "no"]

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.firstTeam.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myRow") as! ScheduleTableViewCell
        
        
        cell.flagFirstTeam.image = UIImage(named: "\(sharedPreferences.array(forKey: "sharedPreferencesFlagFirstTeam")?[indexPath.row] as! String)")
        cell.flagSecondTeam.image = UIImage(named: "\(sharedPreferences.array(forKey: "sharedPreferencesFlagSecondTeam")?[indexPath.row] as! String)")
        cell.firstTeamLabel.text = sharedPreferences.array(forKey: "sharedPreferencesFirstTeam")?[indexPath.row] as? String
        cell.secondTeamLabel.text = sharedPreferences.array(forKey: "sharedPreferencesSecondTeam")?[indexPath.row] as? String
        cell.dateLabel.text = sharedPreferences.array(forKey: "sharedPreferencesDate")?[indexPath.row] as? String
        cell.timeLabel.text = sharedPreferences.array(forKey: "sharedPreferencesTime")?[indexPath.row] as? String
        
        cell.subscribeButton.tag = indexPath.row
        
        let sb = sharedPreferences.array(forKey: "sharedPreferencesSubscribed")?[indexPath.row] as? String
        
        if(sb == "yes"){
            cell.subscribeButton.setTitle("Subscribed!", for: .normal)
        }else{
            cell.subscribeButton.setTitle("Subscribe", for: .normal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Data is not present
       
        if(self.isKeyPresentInUserDefaults(key: "sharedPreferencesData") == false){
            fillTheData()
        }
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
       
        
        
    }
    
    
    @IBAction func subscribeButtonPressed(_ sender: UIButton) {
        
        let index = sender.tag
        
        var prev_array:[String] = self.sharedPreferences.array(forKey: "sharedPreferencesSubscribed") as! [String]
    
        if(prev_array[index] == "yes"){
            prev_array[index] = "no"
        }else{
            prev_array[index] = "yes"
        }
        
        
        sharedPreferences.set(prev_array, forKey: "sharedPreferencesSubscribed")

        tableView.reloadData()
        
    }
    
    
    
    func fillTheData(){
        sharedPreferences.set(true, forKey: "sharedPreferencesData")
        sharedPreferences.set(self.flagFirstTeam, forKey:"sharedPreferencesFlagFirstTeam")
        sharedPreferences.set(self.flagSecondTeam, forKey:"sharedPreferencesFlagSecondTeam")
        sharedPreferences.set(self.firstTeam, forKey: "sharedPreferencesFirstTeam")
        sharedPreferences.set(self.secondTeam, forKey: "sharedPreferencesSecondTeam")
        sharedPreferences.set(self.date, forKey: "sharedPreferencesDate")
        sharedPreferences.set(self.time, forKey: "sharedPreferencesTime")
        sharedPreferences.set(self.subscribed, forKey: "sharedPreferencesSubscribed")
        
    }
    
    // Check key  present
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
}

