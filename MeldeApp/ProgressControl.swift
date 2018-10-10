//
//  ProgressControl.swift
//  MeldeApp
//
//  Created by Christoph Lemke on 10.10.18.
//  Copyright © 2018 Christoph Lemke. All rights reserved.
//

import UIKit

class ProgressControl: UIProgressView {

    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // TODO auslagern
        // Set progressView on value 0.0, scale the view by 4
        //  reportProgressView.progress = 0.0
        //  reportProgressView.transform = reportProgressView.transform.scaledBy(x: 1, y: 4)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // TODO: update the color for smaller details and update the call for update
    func updateProgress(progressValue: Float) -> (Float, UIColor){
        var value: Float = progressValue
        var color: UIColor = UIColor.blue
        // delete the call, if the progress is processed via the originator
        value += 0.01
        let roundedValue = roundf(value * 100) / 100
        
        switch roundedValue {
        case 0.0,
             0.1,
             0.2:
           // print(roundedValue)
            color = UIColor.red
        case 0.3,
             0.4:
            color = UIColor.orange
        case 0.5,
             0.6:
            //print(roundedValue)
            color = UIColor.yellow
        case 0.7,
             0.8:
            color = UIColor.cyan
        case
             0.9,
             1.0:
            print(roundedValue)
            color = UIColor.green
            // delete the call, if the progress is processed via the originator
            value = 1.0
        default:
            color = UIColor.darkGray
            if roundedValue >= 1.0 {
                value = 0.0
                color = UIColor.darkGray
            }
        }
        return (value, color)
    }
}
