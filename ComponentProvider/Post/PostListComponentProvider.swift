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

    // MARK: Init

    public init() {

        self.postListComponent = PostListComponent()

        setUpPostListComponent(
            postListComponent,
            for: postListTableViewController
        )

    }

    // MARK: Update

    public final func update() { }

    // MARK: Set Up

    fileprivate final func setUpPostListComponent(
        _ component: PostListComponent,
        for viewController: PostListTableViewController
    ) { }

}
