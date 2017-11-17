//
//  PostDataProvider.swift
//  ComponentProvider
//
//  Created by Roy Hsu on 17/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PostDataProviderDelegate

public protocol PostDataProviderDelegate: class {

    func dataProviderDidFetch(_ dataProvider: PostDataProvider)

    func dataProvider(
        _ dataProvider: PostDataProvider,
        didFailWith error: Error
    )

}

// MARK: - PostDataProvider

public protocol PostDataProvider: class {

    var dataProviderDelegate: PostDataProviderDelegate? { get set }

    func fetch()

    func numberOfPosts() -> Int

    func post(at index: Int) -> Post

}
