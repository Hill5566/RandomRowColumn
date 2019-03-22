//
//  RandomCollectionViewCell.swift
//  RandomRowColumn
//
//  Created by Lin Hill on 2019/3/21.
//  Copyright © 2019 Lin Hill. All rights reserved.
//

import UIKit

class RandomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    @IBOutlet weak var threeSidesSelectedView: UIView! {
        didSet {
            threeSidesSelectedView.layer.cornerRadius = 6
            threeSidesSelectedView.layer.borderWidth = 2
            threeSidesSelectedView.layer.borderColor = selectedBlueColor.cgColor
            threeSidesSelectedView.isHidden = true
        }
    }
    
    @IBOutlet weak var twoSidesSelectedView: UIView! {
        didSet {
            twoSidesSelectedView.layer.cornerRadius = 4
            twoSidesSelectedView.layer.borderWidth = 2
            twoSidesSelectedView.layer.borderColor = selectedBlueColor.cgColor
            twoSidesSelectedView.isHidden = true
        }
    }
}
