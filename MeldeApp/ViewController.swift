//
//  ViewController.swift
//  MeldeApp
//
//  Created by Christoph Lemke on 09.10.18.
//  Copyright © 2018 Christoph Lemke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var reportTextField: UITextField!
    @IBOutlet weak var reportImageView: UIImageView!
    @IBOutlet weak var reportProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reportProgressView.progress = 0.0
    }
    // TODO: seperate Classe oder Controller
    func updateProgress(){
        var value: Float = reportProgressView.progress
        value += 0.3
        let roundedValue = roundf(value * 100) / 100
        reportProgressView.progress = roundedValue
        
        switch roundedValue {
        case 0.0,
            0.1,
            0.2,
            0.3:
            print(roundedValue)
            reportProgressView.progressTintColor = UIColor.red
        case 0.4,
             0.5,
             0.6:
            print(roundedValue)
            reportProgressView.progressTintColor = UIColor.yellow
        case 0.7,
             0.8,
             0.9,
             1.0:
            print(roundedValue)
            reportProgressView.progressTintColor = UIColor.green
            reportProgressView.progress = 1.0
        default:
            if roundedValue >= 1.0 {
                reportProgressView.progress = 0.0
            }
        }
    }

    //MARK: Action
    @IBOutlet var selectImageFromLibrary: UITapGestureRecognizer!
    // Soll später über zufall verteilt werden
    @IBAction func progressBtnTapped(_ sender: UIButton) {
        updateProgress()
    }
    
}
