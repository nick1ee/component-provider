//
//  PostTableViewCell.swift
//  ComponentProvider
//
//  Created by Roy Hsu on 13/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PostTableViewCell

import UIKit

public final class PostTableViewCell: UITableViewCell {

    // MARK: Property

    @IBOutlet public private(set) final weak var contentLabel: UILabel!

    // MARK: Life Cycle

    public final override func awakeFromNib() {

        setUpContentLabel(contentLabel)

    }

    // MARK: Set Up

    fileprivate final func setUpContentLabel(_ contentLabel: UILabel) {

        contentLabel.text = ""

        contentLabel.numberOfLines = 0

    }

}

// MARK: - Identifiable

extension PostTableViewCell: Identifiable { }
