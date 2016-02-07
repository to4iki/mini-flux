//
//  CounterAction.swift
//  mini-flux
//
//  Created by to4iki on 2/7/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import Foundation

struct CounterAction {
    
    private let dispatcher: EventEmitter<CounterStore>
    
    init(dispatcher: EventEmitter<CounterStore>) {
        self.dispatcher = dispatcher
    }
    
    // "emit" event ---> Store
    func countUp() {
        dispatcher.emit(.Up)
    }
    
    func countDown() {
        dispatcher.emit(.Down)
    }
}