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
    
    // Bind its data with the associated component view controller. A component model works like a view model instead of pure model.
    var component: Component { get }
    
    // A component view controller does layout stuff only.
    var componentViewController: UIViewController { get }
    
    // Call this delegate whenever updates complete or any error occurs.
    var componentProviderDelegate: ComponentProviderDelegate? { set get }
    
    // It's important to a component provider to calculate the correct content size for displaying component view controller. This is going to use as final size of frame of the view controller.
    var contentSize: CGSize { get }
    
    // The most crucial part of a component provider. It handles everything, such as fetching data from a remote or local database, updating its component to trigger the binding to view controller, and finally call componentProviderDelegate while it has done its work.
    func update()
    
}
