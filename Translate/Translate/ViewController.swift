//
//  ViewController.swift
//  Translate
//
//  Created by Anton Rubenchik on 29/04/2019.
//  Copyright © 2019 Anton Rubenchik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Bundle.main.preferredLocalizations.first);
        print(4.square())
    }


    @IBAction func pressButton(_ sender: UIButton) {
        resultLabel.text = String(8.square())
        
        
    }
}
extension Int {
    func square() -> Int {
        return self * self
    }
}

