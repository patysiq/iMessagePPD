//
//  Dinamic.swift
//  iMessagePPD
//
//  Created by PATRICIA S SIQUEIRA on 24/09/24.
//

import Foundation

class Dinamic<T> {
    
    var value: T? {
        didSet {
            update()
        }
    }
    
    var bind: ((T?) -> Void)?
    
    init(_ value: T? = nil) {
        self.value = value
    }
    
    func update() {
        bind?(value)
    }
}
