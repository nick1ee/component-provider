//
//  ComponentProvider.swift
//  Component
//
//  Created by Roy Hsu on 07/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ComponentProvider

import UIKit

public protocol ComponentProvider: class {
    
    var component: Component { get }
    
    var componentViewController: UIViewController { get }
    
    var componentProviderDelegate: ComponentProviderDelegate? { set get }
    
    var contentSize: CGSize { get }
    
    func update()
    
}
