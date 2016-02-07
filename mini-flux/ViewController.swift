//
//  ViewController.swift
//  mini-flux
//
//  Created by to4iki on 2/6/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var countUpButton: UIButton!
    
    @IBOutlet weak var countDownButton: UIButton!
    
    let dispatcher: EventEmitter<CounterStore> = EventEmitter()
    
    lazy var actionCreator: CounterAction = CounterAction(dispatcher: self.dispatcher)
    
    lazy var store: CounterStore = CounterStore(dispatcher: self.dispatcher)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        // <- observe store's change
        store.dispatcher.on(.Change, handler: onChange)
    }
}

extension ViewController {
    
    private func setup() {
        countUpButton.addTarget(self, action: "onCountUpClick:", forControlEvents: .TouchUpInside)
        countDownButton.addTarget(self, action: "onCountDownClick:", forControlEvents: .TouchUpInside)
    }
    
    private func onChange() {
        countLabel.text = "\(self.store.getCount())"
    }
    
    func onCountUpClick(sender: UIButton) {
        actionCreator.countUp()
    }
    
    func onCountDownClick(sender: UIButton) {
        actionCreator.countDown()
    }
}