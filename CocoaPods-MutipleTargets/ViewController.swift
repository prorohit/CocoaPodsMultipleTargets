//
//  ViewController.swift
//  CocoaPods-MutipleTargets
//
//  Created by Rohit.Singh on 13/02/17.
//  Copyright © 2017 Rohit.Singh. All rights reserved.
//

import UIKit
import ReachabilitySwift

class ViewController: UIViewController {
    
    let reachability = Reachability()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        reachability?.whenReachable = { reachability in
        
            DispatchQueue.main.async {
                if reachability.isReachableViaWiFi {
                    print("Reachable via WIFI")
                } else {
                    print("Reachable via Cellular")
                }
            }
        }
        
        
        reachability?.whenUnreachable = {reachability in
            DispatchQueue.main.async {
                print("Internet is not connected")
            }
        
        }
        
        
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start the Notifier")
        }
        
}

   
}

