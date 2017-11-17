//
//  ComponentComposer.swift
//  Component
//
//  Created by Roy Hsu on 02/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ComponentComposer

import UIKit

public protocol ComponentComposer {
    
    func numberOfComponentProviders() -> Int
    
    func componentProvider(at index: Int) -> ComponentProvider
    
    func index(of componentProvider: ComponentProvider) -> Int?
    
}
