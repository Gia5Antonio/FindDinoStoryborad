//
//  ViewController.swift
//  findDino
//
//  Created by Antonio Giaquinto on 13/02/2018.
//  Copyright © 2018 Antonio Giaquinto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var heads: [UIButton]!
    @IBOutlet weak var pointsLabel: UILabel!
    
    var points = 0
    var points30s = 0
    var points120s = 0
    var seconds = 0
    var timer = Timer()
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        runTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    func endTimer() {
        print("Restart ok")
        timer.invalidate()
        seconds = 0
        isTimerRunning = false
    }
    
    @objc func updateTimer(){
        seconds += 1
        debugPrint(seconds)
        
        if seconds == 30 {
            points30s = points
            debugPrint("Points 30s: \(points30s)")
        }
        
        if seconds == 120 {
            points120s = points
            debugPrint("Points 120s: \(points120s)")
        }
        
    }
    
    @IBAction func headPressed(_ sender: Any) {
        
        let button = sender as! UIButton
        debugPrint("Tag: \(button.tag)")
        heads[button.tag].setImage(#imageLiteral(resourceName: "h"), for: .normal)
        heads[button.tag].isEnabled = false
        points += 1
        pointsLabel.text = "\(points)"
        
        if points == 30 {
            endTimer()
        }
    }
}

