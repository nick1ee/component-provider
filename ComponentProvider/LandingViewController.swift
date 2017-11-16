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
    
    // MARK: View Life Cycle
    
    public final override func viewDidLoad() {
        
        super.viewDidLoad()
        
        emojiComponentProvider.componentProviderDelegate = self
        
        emojiComponentProvider.emojiComponent.emoji = "😀"
        
        let landingComponentComposer = LandingComponentComposer()
        
        landingComponentComposer.componentProviders = [ emojiComponentProvider ]
        
        self.componentComposer = landingComponentComposer
        
    }
    
    public final override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        emojiComponentProvider.contentSize = CGSize(
            width: view.bounds.width,
            height: 150.0
        )
        
        emojiComponentProvider.update()
        
    }
    
}
