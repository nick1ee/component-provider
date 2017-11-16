//
//  ComponentBasedViewController.swift
//  Component
//
//  Created by Roy Hsu on 08/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ComponentBasedViewController

import UIKit

// Override this base view controller and provide a dedicated component composer.
open class ComponentBasedViewController: UITableViewController {
    
    // MARK: Property
    
    public final var componentComposer: ComponentComposer?
    
    // MARK: Init
    
    public init() { super.init(style: .plain) }
    
    public required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    
    // MARK: View Life Cycle
    
    // You can override this method for basic setup. DO NOT forgot to call the super.
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpTableView(tableView)
        
    }
    
    // MARK: Set Up
    
    fileprivate final func setUpTableView(_ tableView: UITableView) {
        
        tableView.register(
            ComponentTableViewCell.self,
            forCellReuseIdentifier: ComponentTableViewCell.identifier
        )
        
        tableView.separatorStyle = .none
        
    }
    
    // MARK: UITableViewDataSource
    
    // Map one section to one component provider.
    public final override func numberOfSections(in tableView: UITableView) -> Int {
        
        return componentComposer?.componentProviders.count ?? 0
        
    }
    
    public final override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    )
    -> Int { return 1 }
    
    public final override func tableView(
        _ tableView: UITableView,
        estimatedHeightForRowAt indexPath: IndexPath
    )
    -> CGFloat {
        
        // I have the same issue, except I actually want to use estimatedRowHeight.
        // I found that by setting the estimatedRowHeight to a number larger than the actual height of the cell seems to improve the behavior slightly (the table view only scrolls a little bit).
        // – Awesomeness
        // Reference: https://stackoverflow.com/questions/24767665/uitableview-bouncing-back-to-the-top-of-a-section-when-calling-reloadrowsatindex
     
        return self.tableView(
            tableView,
            heightForRowAt: indexPath
        )
        
    }
    
    public final override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    )
    -> CGFloat {
        
        guard
            let componentProvider = componentComposer?.componentProvider(for: indexPath)
        else { return 44.0 }
        
        return componentProvider.contentSize.height
        
    }
    
    public final override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    )
    -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ComponentTableViewCell.identifier,
            for: indexPath
        ) as! ComponentTableViewCell
        
        cell.selectionStyle = .none
        
        if let componentProvider = componentComposer?.componentProvider(for: indexPath) {

            let componentViewController = componentProvider.componentViewController
            
            let componentView = componentViewController.view!
            
            if componentView.superview != nil {
                
                componentViewController.willMove(toParentViewController: nil)
                
                componentView.removeFromSuperview()
                
                componentViewController.removeFromParentViewController()
                
            }
            
            if !childViewControllers.contains(componentViewController) {
                
                addChildViewController(componentViewController)
                
            }
            
            cell.contentView.addSubview(componentView)
            
            componentView.translatesAutoresizingMaskIntoConstraints = false
            
            componentView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
            
            componentView.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
            
            componentView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
            
            componentView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
            
            componentViewController.didMove(toParentViewController: self)

        }
        
        return cell
            
    }
    
}

// MARK: - ComponentProviderDelegate

extension ComponentBasedViewController: ComponentProviderDelegate {
    
    public final func providerDidUpdate(_ provider: ComponentProvider) {
        
        guard
            let componentProviders = componentComposer?.componentProviders,
            let index = componentProviders.index(
                where: { $0.componentViewController === provider.componentViewController }
            )
        else { return }

        tableView.beginUpdates()

        tableView.reloadSections(
            IndexSet(integer: index),
            with: .automatic
        )

        tableView.endUpdates()
        
    }
    
    // Override this method for custom error hanlding.
    open func provider(
        _ provider: ComponentProvider,
        didFailWith error: Error
    ) { }
    
}
