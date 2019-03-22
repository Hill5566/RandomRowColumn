//
//  ViewController.swift
//  RandomRowColumn
//
//  Created by Lin Hill on 2019/3/21.
//  Copyright © 2019 Lin Hill. All rights reserved.
//

import UIKit

let selectedBlueColor = UIColor(red: 27/255, green: 211/255, blue: 213/255, alpha: 1)

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let minimumLineSpacingForSection:CGFloat = 0
    let minimumInteritemSpacingForSection:CGFloat = 0
    let randomTimeInterval = 3.0
    
    var row:Int = 3
    var column:Int = 6
    var lattics:[lattic] = []
    
    var randomRow = 0
    var randomColumn = 0
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mCollectionView.collectionViewLayout.invalidateLayout()
        
        for row in 1...(row+1) {
            let randomColor = UIColor.random
            for column in 1...column {
                lattics.append(lattic(row: row, column: column, backgroundColor: randomColor.withAlphaComponent(0.2), bottomColor: randomColor, selected: false))
            }
        }
        
        startRandom()
    }
    
    func startRandom() {
        
        Timer.scheduledTimer(withTimeInterval: randomTimeInterval, repeats: true) { (timer) in
            self.clearTalbe()
            
            self.randomRow = Int.random(in: 1...self.row)
            self.randomColumn = Int.random(in: 1...self.column)
            
            print("row:", self.randomRow, "column:", self.randomColumn)

            for (index, lattic) in self.lattics.enumerated() {
                if lattic.row == self.randomRow && lattic.column == self.randomColumn {
                    self.lattics[index].selected = true
                }
            }

            self.mCollectionView.reloadData()
        }
    }
    
    func clearTalbe() {
        randomRow = 0
        randomColumn = 0
        for (index, _) in lattics.enumerated() {
            lattics[index].selected = false
        }
        mCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        
        let height = collectionView.frame.height
        
        let w = (width-CGFloat(column)*minimumInteritemSpacingForSection)/CGFloat(column)
        let h = (height-CGFloat(row)*minimumLineSpacingForSection)/CGFloat(row+1)
        
        return CGSize(width: w, height:h)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacingForSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInteritemSpacingForSection
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
        
        let lattic = lattics[indexPath.row]
        
        randomCell.label.text = lattic.selected ? "random" : ""
        randomCell.bottomLabel.backgroundColor = lattic.bottomColor
        randomCell.backView.backgroundColor = lattic.backgroundColor
        
        if lattic.column == randomColumn {
            
            if lattic.row == 1 {
                randomCell.threeSidesSelectedView.isHidden = false
                randomCell.twoSidesSelectedView.isHidden = true
            } else {
                randomCell.threeSidesSelectedView.isHidden = true
                randomCell.twoSidesSelectedView.isHidden = false
            }
            
            confirmCell.selectedFrameView.isHidden = false
            
            confirmCell.selectedView.backgroundColor = UIColor(red: 27/255, green: 211/255, blue: 213/255, alpha: 1)
            confirmCell.selectedView.layer.borderColor = UIColor(red: 27/255, green: 211/255, blue: 213/255, alpha: 1).cgColor
            
            confirmCell.label.textColor = .white
            
        } else {
            
            randomCell.twoSidesSelectedView.isHidden = true
            randomCell.threeSidesSelectedView.isHidden = true
            
            confirmCell.selectedFrameView.isHidden = true
            
            confirmCell.selectedView.backgroundColor = UIColor.clear
            confirmCell.selectedView.layer.borderColor = UIColor(red: 159/255, green: 159/255, blue: 159/255, alpha: 1).cgColor
            
            confirmCell.label.textColor = .gray
        }
        
        return indexPath.row < row*column ? randomCell : confirmCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        if indexPath.row < row*column  {
            print("RANDOM")
        } else {
            print("CONFIRM")
        }
        
        if indexPath.row+1 == (row)*column+randomColumn {
            clearTalbe()
        } else {
            print(indexPath.row)
            print((row)*column+randomColumn)
        }
    }
    
    struct lattic {
        var row:Int
        var column:Int
        var backgroundColor:UIColor
        var bottomColor:UIColor
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
