//
//  FirstVC.swift
//  RandomRowColumn
//
//  Created by Lin Hill on 2019/3/21.
//  Copyright © 2019 Lin Hill. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var rowTF: UITextField!
    
    @IBOutlet weak var columnTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func click(_ sender: UIButton) {
        
        view.endEditing(true)
        
        if let _ = Int(rowTF.text!), let _ = Int(columnTF.text!) {
            performSegue(withIdentifier: "table", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! ViewController
        vc.row = Int(rowTF.text!)!
        vc.column = Int(columnTF.text!)!
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
