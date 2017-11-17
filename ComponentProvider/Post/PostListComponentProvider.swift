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

    public final var contentSize: CGSize {

        didSet {

            setUpContentSize(
                contentSize,
                for: postListTableViewController
            )

        }

    }

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

        // Walkaround: DO NOT set a value that is too small to calculate content size of table view.
        // Reference:
        // 1. https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithSelf-SizingTableViewCells.html
        // 2. https://useyourloaf.com/blog/self-sizing-table-view-cells/
        // 3. https://stackoverflow.com/questions/9958328/when-does-a-uitableviews-contentsize-get-set/17939938#17939938
        // 4. https://stackoverflow.com/questions/36002741/uitableview-content-size-while-using-auto-layout
        self.contentSize = CGSize(
            width: 0.0,
            height: UIScreen.main.bounds.height
        )

        setUpPostListViewController(postListTableViewController)

        setUpPostListComponent(
            postListComponent,
            for: postListTableViewController
        )

        setUpContentSize(
            contentSize,
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

    fileprivate final func setUpPostListViewController(_ viewController: PostListTableViewController) {

        viewController.tableView.backgroundColor = .yellow

        viewController.tableView.isScrollEnabled = false

        viewController.tableView.contentInsetAdjustmentBehavior = .never

    }

    fileprivate final func setUpPostListComponent(
        _ component: PostListComponent,
        for viewController: PostListTableViewController
    ) { }

    fileprivate final func setUpContentSize(
        _ contentSize: CGSize,
        for viewController: PostListTableViewController
    ) {

        viewController.view.frame = CGRect(
            origin: .zero,
            size: contentSize
        )

    }

    fileprivate final func setUpPostDataProvider(
        _ dataProvider: PostDataProvider?,
        for viewController: PostListTableViewController
    ) { viewController.postDataProvider = dataProvider }

}

// MARK: - PostDataProviderDelegate

extension PostListComponentProvider: PostDataProviderDelegate {

    public func dataProviderDidFetch(_ dataProvider: PostDataProvider) {

        let tableView = postListTableViewController.tableView!

        tableView.layoutIfNeeded()

        contentSize = tableView.contentSize

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
