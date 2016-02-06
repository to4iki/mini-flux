//
//  ViewController.swift
//  mini-flux
//
//  Created by to4iki on 2/6/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var countUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

extension ViewController {
    
    private func setup() {
        countUpButton.addTarget(self, action: "onClick:", forControlEvents: .TouchUpInside)
    }
    
    private func onClick(sender: AnyObject) {
        print("clicked!")
    }
}