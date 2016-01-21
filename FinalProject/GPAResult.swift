//
//  GPAResult.swift
//  FinalProject
//
//  Created by Noah Guy on 12/8/15.
//  Copyright © 2015 Noah Guy. All rights reserved.
//

import UIKit

class GPAResult: UIViewController {
    @IBOutlet weak var weightedGPA: UILabel!
    @IBOutlet weak var unweightedGPA: UILabel!
    var weighted = ""
    var unweighted = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Results"
        weightedGPA.text = weighted
        unweightedGPA.text = unweighted

        // Do any additional setup after loading the view.
    }

    
}
