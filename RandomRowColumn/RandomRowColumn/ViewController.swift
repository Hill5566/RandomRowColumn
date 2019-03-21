//
//  ViewController.swift
//  RandomRowColumn
//
//  Created by Lin Hill on 2019/3/21.
//  Copyright © 2019 Lin Hill. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var row:Int = 3
    var column:Int = 10
    var lattics:[lattic] = []
    
    
    var randomRow = 0
    var randomColumn = 0
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for row in 0..<(row+1) {
            for column in 0..<column {
                lattics.append(lattic(row: row, column: column, selected: false))
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (timer) in
            
            self.randomRow = Int.random(in: 0..<self.row)
            self.randomColumn = Int.random(in: 0..<self.column)
            
            
            self.mCollectionView.reloadData()
        }
    }
    
    func clearTable() {
        lattics = []
        for row in 0..<(row+1) {
            for column in 0..<column {
                lattics.append(lattic(row: row, column: column, selected: false))
            }
        }
        mCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        
        return CGSize(width: (width-CGFloat(column))/CGFloat(column), height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lattics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let randomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RandomCell", for: indexPath) as! RandomCollectionViewCell
        let confirmCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConfirmCell", for: indexPath) as! ConfirmCollectionViewCell
        
        if lattics[indexPath.row].selected {
            randomCell.label.text = "Random"
        } else {
            randomCell.label.text = "\(indexPath.row+1)"
        }
        
        
        if indexPath.row < row*column {
            return randomCell
        } else {
            return confirmCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        if indexPath.row < row*column {
            print("RANDOM")
        } else {
            print("CONFIRM")
        }
    }
    
    struct lattic {
        var row:Int
        var column:Int
        var selected:Bool
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
