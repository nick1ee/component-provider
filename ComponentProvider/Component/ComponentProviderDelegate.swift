//
//  ComponentProviderDelegate.swift
//  Component
//
//  Created by Roy Hsu on 07/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ComponentProviderDelegate

import UIKit

public protocol ComponentProviderDelegate: class {
    
    func providerDidUpdate(_ provider: ComponentProvider)
    
    func provider(
        _ provider: ComponentProvider,
        didFailWith error: Error
    )
    
}
