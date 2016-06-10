//
//  ViewController.swift
//  iOSarch
//
//  Created by Omar Josue on 10/19/15.
//  Copyright © 2015 SELEGNA Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Unwind is like Segue back
    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        // performs additional code while unwinding!
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "toModel"){
            if let mvc = segue.destinationViewController as? ModelViewController {
                mvc.fromViewController = true
            }
        }else if(segue.identifier == "toComponent"){
            if let cvc = segue.destinationViewController as? ComponentViewController {
                cvc.fromViewController = true
            }
        }else if(segue.identifier == "toNavigation"){
            if let nvc = segue.destinationViewController as? NavigationViewController {
                nvc.fromViewController = true
            }
        }
    }
    
}
