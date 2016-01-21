//
//  FinalGradeSelector.swift
//  FinalProject
//
//  Created by Noah Guy on 12/8/15.
//  Copyright © 2015 Noah Guy. All rights reserved.
//

import UIKit

class FinalGradeSelector: UIViewController {

    @IBOutlet weak var currentGrade: UITextField!
    @IBOutlet weak var finalExamGrade: UITextField!
    @IBOutlet weak var wantedFinal: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Final Grade Calculator"
        // Do any additional setup after loading the view.
    }

    func calculateFinal() -> Double{
        let current = currentGrade.text
        let projected = finalExamGrade.text
        return (0.2 * (projected! as NSString).doubleValue) + (0.8 * (current! as NSString).doubleValue)
    }
    func calculateRequired() -> Double{
        let current = currentGrade.text
        let wanted = wantedFinal.text
        let comp1 = (current! as NSString).doubleValue * 0.01
        let comp2 = (wanted! as NSString).doubleValue * 0.01
        var computation = (comp2 - (0.2 * comp1)) / 0.2
        print("\(computation)")
        return computation * 100
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextVC = segue.destinationViewController as! FinalGradeResult
        let final = calculateFinal()
        nextVC.wantedGrade = wantedFinal.text!
        nextVC.finalDisplay = "\(final)"
        nextVC.proposed = "In order to get a " + nextVC.wantedGrade + ", you must get a \(calculateRequired()) on the final exam. Good Luck!" 
    }

}
