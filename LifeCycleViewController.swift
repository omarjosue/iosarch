//
//  FirstViewController.swift
//  iOSarch
//
//  Created by Omar Josue on 10/16/15.
//  Copyright © 2015 SELEGNA Consulting. All rights reserved.
//

import UIKit

class LifeCycleViewController: UIViewController {
    var alertTitle: String = "From State"
    var alertMessage: String  = "Methods"
    var alert: UIAlertController?;
    var present = true
    var previousForeground = 0, previousBackground  = -1;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        prepareAlert()
    }
    
    private func prepareAlert(){
        let alertAction = UIAlertAction(title: "Got it!", style: UIAlertActionStyle.Default, handler: nil)
        alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        alert!.addAction(alertAction)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func chageForeground(sender: UISegmentedControl, forEvent event: UIEvent) {
        
        switch sender.selectedSegmentIndex{
            case 1: alert!.title = previousForeground == 0 ? "From Not running" : "From Active"
                    alert!.message = previousForeground == 0 ? "didFinishLaunching()" : "willResignActive()"
                    previousForeground = sender.selectedSegmentIndex
                    present = true
                    break
            case 2: if(previousForeground == 0){
                        alert!.title = "Not permitted flow"
                        alert!.message = "Get back"
                        sender.selectedSegmentIndex = previousForeground
                    }else{
                        alert!.title = "From Inactive"
                        alert!.message = "didBecomeActive()"
                        previousForeground = sender.selectedSegmentIndex
                    }
                    present = true
                    break
            default: present = false
                    break
        }
        
        if (present){
            presentViewController(alert!, animated: true, completion: nil)
            present = !present
        }
    }

    @IBAction func changeBackground(sender: UISegmentedControl, forEvent event: UIEvent) {
        
        switch sender.selectedSegmentIndex{
            case 0: if(previousBackground == 1){
                        alert!.title = "From Background"
                        alert!.message = "willEnterForeground()"
                        previousBackground = sender.selectedSegmentIndex
                        present = true
                    }else if(previousBackground > 1){
                        alert!.title = "Not permitted flow"
                        alert!.message = "Get back"
                        sender.selectedSegmentIndex = previousBackground
                        present = true
                    }else{
                        previousBackground = sender.selectedSegmentIndex
                    }
                    break
            case 1: if(previousBackground == 0){
                        alert!.title = "From Inactive"
                        alert!.message = "didEnterBackground()"
                        previousBackground = sender.selectedSegmentIndex
                        present = true
                    }else if(previousBackground == -1){
                        alert!.title = "Not permitted flow"
                        alert!.message = "Get inactive first"
                        sender.selectedSegmentIndex = previousBackground
                        present = true
                    }else{
                        previousBackground = sender.selectedSegmentIndex
                    }
                    break
            case 2: if(previousBackground < 1){
                        alert!.title = "Not permitted flow"
                        alert!.message = "Get back"
                        sender.selectedSegmentIndex = previousBackground
                        present = true
                    }else{
                        previousBackground = sender.selectedSegmentIndex
                    }
                    break
            default: present = false
                    break
        }
        
        if (present){
            presentViewController(alert!, animated: true, completion: nil)
            present = !present
        }
    }
}

