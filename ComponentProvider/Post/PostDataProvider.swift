//
//  PostDataProvider.swift
//  ComponentProvider
//
//  Created by Roy Hsu on 17/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PostDataProvider

public protocol PostDataProvider: class {

    func numberOfPosts() -> Int

    func post(at index: Int) -> Post

}
