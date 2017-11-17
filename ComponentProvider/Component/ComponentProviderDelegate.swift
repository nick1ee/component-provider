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

    func componentProviderDidUpdate(_ componentProvider: ComponentProvider)

    func componentProvider(
        _ componentProvider: ComponentProvider,
        didFailWith error: Error
    )

}
