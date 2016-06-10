//
//  ModelViewController.swift
//  iOSarch
//
//  Created by Omar Josue on 10/19/15.
//  Copyright © 2015 SELEGNA Consulting. All rights reserved.
//

import UIKit

class ModelViewController: UIViewController {
    
    var fromViewController = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation with push and pop
    @IBAction func performNavigation() {
        if(fromViewController){
            self.navigationController?.popViewControllerAnimated(true)
        }else{ //From CustomUITableViewCell
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("viewcontroller")
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
}
