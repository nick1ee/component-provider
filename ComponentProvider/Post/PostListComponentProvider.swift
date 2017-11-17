//
//  PostListComponentProvider.swift
//  ComponentProvider
//
//  Created by Roy Hsu on 17/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PostListComponentProvider

import UIKit

public final class PostListComponentProvider: ComponentProvider {

    // MARK: Property

    public final var postListComponent: PostListComponent {

        didSet {

            setUpPostListComponent(
                postListComponent,
                for: postListTableViewController
            )

        }

    }

    public final let postListTableViewController = PostListTableViewController()

    public final var component: Component { return postListComponent }

    public final var componentViewController: UIViewController { return postListTableViewController }

    public final weak var componentProviderDelegate: ComponentProviderDelegate?

    public final var contentSize: CGSize = .zero

    public final weak var postDataProvider: PostDataProvider? {

        didSet {

            setUpPostDataProvider(
                postDataProvider,
                for: postListTableViewController
            )

        }

    }

    // MARK: Init

    public init() {

        self.postListComponent = PostListComponent()

        setUpPostListComponent(
            postListComponent,
            for: postListTableViewController
        )

    }

    // MARK: Update

    public final func update() {

        guard
            let postDataProvider = postDataProvider
        else {

            componentProviderDelegate?.componentProviderDidUpdate(self)

            return

        }

        postDataProvider.dataProviderDelegate = self

        postDataProvider.fetch()

    }

    // MARK: Set Up

    fileprivate final func setUpPostListComponent(
        _ component: PostListComponent,
        for viewController: PostListTableViewController
    ) { }

    fileprivate final func setUpPostDataProvider(
        _ dataProvider: PostDataProvider?,
        for viewController: PostListTableViewController
    ) { viewController.postDataProvider = dataProvider }

}

// MARK: - PostDataProviderDelegate

extension PostListComponentProvider: PostDataProviderDelegate {

    public func dataProviderDidFetch(_ dataProvider: PostDataProvider) {

        componentProviderDelegate?.componentProviderDidUpdate(self)

    }

    public func dataProvider(
        _ dataProvider: PostDataProvider,
        didFailWith error: Error
    ) {

        componentProviderDelegate?.componentProvider(
            self,
            didFailWith: error
        )

    }

}
