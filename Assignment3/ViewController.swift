//
//  ViewController.swift
//  Assignment3
//
//  Created by Kayla Ziegler on 3/29/16.
//  Copyright © 2016 Kayla Ziegler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var directionLabel: UILabel!
    @IBOutlet weak var homeButton: UIButton!
    
    var terms : [String] = ["Let vs. Var", "Computed Initializer", "Computed Variable", "Setter Observer", "Function", "External Parameter", "Default Parameter", "Anonymous Function", "Optional Chaining", "Failable Initializer", "Casting", "Class Method", "Extension", "Enumeration", "Error Handling", "Dictionary", "Conditional Binding", "Protocol", "Inheritance", "Struct", "Enum", "Class", "Subscript", "Setter Observer"]
    
    @IBOutlet weak var timerLabel: UILabel!
    var timer = NSTimer()
    var seconds = 31
    //let timerInt:NSTimeInterval = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.subtractTime), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func subtractTime() {
        seconds -= 1
        self.timerLabel.text = "\(seconds)"
        
        if(seconds == 0)  {
            hitNext(0)
        }
        
        
    }

    @IBAction func hitPlay(sender: AnyObject) {
        titleLabel.hidden = true
        playButton.hidden = true
        directionLabel.hidden = true
        homeButton.hidden = false
        nextButton.hidden = false
        termLabel.hidden = false
        timerLabel.hidden = false
        
        let randIndex = arc4random_uniform(24)
        self.termLabel.text = "\(terms[Int(randIndex)])"
        
        
        
    }
    @IBAction func hitNext(sender: AnyObject) {
        
        seconds = 31
        let randIndex = arc4random_uniform(24)
        self.termLabel.text = "\(terms[Int(randIndex)])"

        
    }

    @IBAction func goHome(sender: AnyObject) {
        titleLabel.hidden = false
        playButton.hidden = false
        directionLabel.hidden = false
        nextButton.hidden = true
        termLabel.hidden = true
        timerLabel.hidden = true
        homeButton.hidden = true
    }
}

