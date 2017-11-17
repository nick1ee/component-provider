//
//  LandingComponentComposer.swift
//  ComponentProvider
//
//  Created by Roy Hsu on 17/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - LandingComponentComposer

public final class LandingComponentComposer: ComponentComposer {
    
    // MARK: Property
    
    public final var componentProviders: [ComponentProvider] = []
    
    // MARK: ComponentComposer
    
    public final func numberOfComponentProviders() -> Int {
        
        return componentProviders.count
        
    }
    
    public final func componentProvider(at index: Int) -> ComponentProvider {
        
        return componentProviders[index]
        
    }
    
    public func index(of componentProvider: ComponentProvider) -> Int? {
        
        return componentProviders.index { $0 === componentProvider }
        
    }
    
}
