//
//  PostDataProvider+IndexPath.swift
//  ComponentProvider
//
//  Created by Roy Hsu on 17/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - IndexPath

import Foundation

public extension PostDataProvider {

    public func post(at indexPath: IndexPath) -> Post {

        return post(at: indexPath.section)

    }

}
