//
//  closeViewController.swift
//  Bulls Eye
//
//  Created by Shivam Maggu on 05/02/19.
//  Copyright © 2019 Shivam Maggu. All rights reserved.
//

import UIKit

class closeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}
