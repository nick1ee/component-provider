//
//  EmojiComponentProvider.swift
//  ComponentProvider
//
//  Created by 許郁棋 on 17/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - EmojiComponentProvider

import UIKit

public final class EmojiComponentProvider: ComponentProvider {
    
    // MARK: Property
    
    public final let emojiComponent = EmojiComponent(emoji: nil)
    
    public final let emojiViewController = EmojiViewController()
    
    public final var component: Component { return emojiComponent }
    
    public final var componentViewController: UIViewController { return emojiViewController }
    
    public final weak var componentProviderDelegate: ComponentProviderDelegate?
    
    public final var contentSize: CGSize = .zero
    
    public final func update() {
        
        emojiViewController.view.backgroundColor = .black
        
        emojiViewController.view.frame = CGRect(
            origin: .zero,
            size: contentSize
        )
        
        componentProviderDelegate?.providerDidUpdate(self)
        
    }

}
