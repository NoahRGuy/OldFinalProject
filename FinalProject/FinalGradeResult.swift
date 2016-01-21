//
//  FinalGradeResult.swift
//  FinalProject
//
//  Created by Noah Guy on 12/8/15.
//  Copyright © 2015 Noah Guy. All rights reserved.
//

import UIKit

class FinalGradeResult: UIViewController {
    @IBOutlet weak var finalGrade: UILabel!
    @IBOutlet weak var proposedGrade: UITextView!
    var wantedGrade = ""
    var finalDisplay = ""
    var proposed = ""

    override func viewDidLoad() {        super.viewDidLoad()
        finalGrade.text = finalDisplay
        proposedGrade.text = proposed
        self.title = "Results"
        // Do any additional setup after loading the view.
    }

}
