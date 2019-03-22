//
//  ConfirmCollectionViewCell.swift
//  RandomRowColumn
//
//  Created by Lin Hill on 2019/3/21.
//  Copyright © 2019 Lin Hill. All rights reserved.
//

import UIKit

class ConfirmCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var selectedFrameView: UIView! {
        didSet {
            selectedFrameView.layer.cornerRadius = 4
            selectedFrameView.layer.borderColor = UIColor(red: 27/255, green: 211/255, blue: 213/255, alpha: 1).cgColor
            selectedFrameView.layer.borderWidth = 2
            
        }
    }
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var selectedView: UIView! {
        didSet {
            selectedView.layer.cornerRadius = 4
            selectedView.layer.borderColor = UIColor(red: 159/255, green: 159/255, blue: 159/255, alpha: 1).cgColor
            selectedView.layer.borderWidth = 1
            
        }
    }
}
