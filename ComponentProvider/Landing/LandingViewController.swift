//
//  LandingViewController.swift
//  ComponentProvider
//
//  Created by Roy Hsu on 17/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - LandingViewController

import UIKit

public final class LandingViewController: ComponentBasedViewController {

    // MARK: Property

    public final let emojiComponentProvider = EmojiComponentProvider()

    public final let postListComponentProvider = PostListComponentProvider()

    private final let postDataProvider = MockPostDataProvider()

    // MARK: View Life Cycle

    public final override func viewDidLoad() {

        super.viewDidLoad()

        emojiComponentProvider.componentProviderDelegate = self

        emojiComponentProvider.emojiComponent.emoji = "😀"

        postListComponentProvider.componentProviderDelegate = self

        postListComponentProvider.postDataProvider = postDataProvider

        let landingComponentComposer = LandingComponentComposer()

        landingComponentComposer.componentProviders = [
            emojiComponentProvider,
            postListComponentProvider
        ]

        self.componentComposer = landingComponentComposer

    }

    public final override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)

        emojiComponentProvider.contentSize = CGSize(
            width: view.bounds.width,
            height: 150.0
        )

        emojiComponentProvider.update()

        let estimatedHeight: CGFloat = 44.0

        postListComponentProvider.contentSize = CGSize(
            width: view.bounds.width,
            height: estimatedHeight
        )

        postListComponentProvider.update()

    }

}
