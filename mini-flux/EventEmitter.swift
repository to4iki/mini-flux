//
//  EventEmitter.swift
//  mini-flux
//
//  Created by to4iki on 2/7/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import Foundation

protocol Store {
    typealias Event: Equatable
}

// Publisher
class EventEmitter<T: Store> {
    
    typealias Identifier = String
    
    private var listeners: Dictionary<Identifier, EventListener<T>> = [:]
    
    private var lastListenerIdentifier = 0
    
    init() {}
    
    deinit {
        listeners.removeAll()
    }
}

extension EventEmitter {
    
    private func nexttListenerIdentifier() -> Identifier {
        return "EVENT_LISTENER_\(++lastListenerIdentifier)"
    }
}

extension EventEmitter {
    
    func emit(event: T.Event) {
        listeners.forEach { (identifier, listener) -> Void in
            if listener.event == event {
                listener.handler()
            }
        }
    }
    
    func on(event: T.Event, handler: () -> Void) -> Identifier {
        let id = nexttListenerIdentifier()
        listeners[id] = EventListener<T>(event: event, handler: handler)
        return id
    }
    
    func off(id: Identifier) {
        listeners.removeValueForKey(id)
    }
}

struct EventListener<T: Store> {
    
    let event: T.Event
    
    let handler: () -> Void
}