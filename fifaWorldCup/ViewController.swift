//
//  ViewController.swift
//  fifaWorldCup
//
//  Created by Shaishav Solanki on 2019-03-07.
//  Copyright © 2019 Shaishav Solanki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    let sharedPreferences = UserDefaults.standard

    
    var firstTeam = ["Canada", "Brazil", "U.S", "Canada", "U.S"]
    var secondTeam = ["India", "Vietnam", "India", "Vietnam", "Brazil"]
    var time = ["07:00 AM", "11:00 AM", "03:00 PM", "06:00 PM", "09:00 PM"]
    var date = ["March 11, 2019", "March 11, 2019", "March 12, 2019", "March 12, 2019", "March 13, 2019"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.firstTeam.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myRow") as! ScheduleTableViewCell
        
        cell.firstTeamLabel.text = self.firstTeam[indexPath.row]
        cell.secondTeamLabel.text = self.secondTeam[indexPath.row]
        cell.dateLabel.text = self.date[indexPath.row]
        cell.timeLabel.text = self.time[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
       
        
        
    }
    
    
    @IBAction func subscribeButton(_ sender: UIButton) {
        
        if(self.isKeyPresentInUserDefaults(key: "data")){
            
            let alert = UIAlertController(title: "Alert", message: "Valid Key", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            
            // Data is not present
            fillTheData()
            
        }
        
    }
    
    
    func fillTheData(){
    
        sharedPreferences.set(self.firstTeam, forKey: "sharedPreferencesFirstTeam")
        sharedPreferences.set(self.secondTeam, forKey: "sharedPreferencesSecondTeam")
        sharedPreferences.set(self.date, forKey: "sharedPreferencesDate")
        sharedPreferences.set(self.time, forKey: "sharedPreferencesTime")
        
    }
    
    // Check key  present
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
}

