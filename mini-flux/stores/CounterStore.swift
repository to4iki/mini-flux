//
//  CounterStore.swift
//  mini-flux
//
//  Created by to4iki on 2/7/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import Foundation

class CounterStore: Store {
    
    enum CounterEvent {
        case Up
        case Down
        case Change
    }
    
    typealias Event = CounterEvent
    
    let dispatcher: EventEmitter<CounterStore>
    
    // model
    private var count = 0
    
    init(dispatcher: EventEmitter<CounterStore>) {
        self.dispatcher = dispatcher
        
        // <--- observer event
        dispatcher.on(.Up, handler: onCountUp)
        dispatcher.on(.Down, handler: onCountDown)
    }
}

extension CounterStore {
    
    func getCount() -> Int {
        return count
    }
    
    // "emit" change event ---> self
    private func onCountUp() {
        count++
        dispatcher.emit(.Change)
    }
    
    private func onCountDown() {
        count--
        dispatcher.emit(.Change)
    }
}