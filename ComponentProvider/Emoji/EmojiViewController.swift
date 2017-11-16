//
//  EmojiViewController.swift
//  ComponentProvider
//
//  Created by Roy Hsu on 16/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - EmojiViewController

import UIKit

public final class EmojiViewController: UIViewController {
    
    // MARK: Property
    
    public final let label = UILabel()
    
    // MARK: View Life Cycle
    
    public final override func loadView() { view = label }
    
    public final override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpLabel(label)
        
    }
    
    // MARK: Set Up
    
    fileprivate final func setUpLabel(_ label: UILabel) {
        
        label.backgroundColor = .white
        
        label.textAlignment = .center
        
        label.font = .systemFont(ofSize: 20.0)
        
    }
    
}
