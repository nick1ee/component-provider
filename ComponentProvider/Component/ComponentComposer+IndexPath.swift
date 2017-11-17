//
//  ComponentComposer+IndexPath.swift
//  Component
//
//  Created by Roy Hsu on 08/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - IndexPath

import Foundation

public extension ComponentComposer {

    public func componentProvider(for indexPath: IndexPath) -> ComponentProvider { return componentProvider(at: indexPath.section) }

}
