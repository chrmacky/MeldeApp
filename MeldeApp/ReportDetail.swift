//
//  ReportDetail.swift
//  MeldeApp
//
//  Created by Christoph Lemke on 11.10.18.
//  Copyright © 2018 Christoph Lemke. All rights reserved.
//

import UIKit

class ReportDetail{
    //MARK: Properties
    var reportName: String
    var reportDesc: String?
    var reportProgress: Float
    var reportImage: UIImage?
    var reportOriginator: UUID
    var reportOwner: UUID
    
    //MARK: Initialization
    init?(name: String, desc: String, progress: Float, photo: UIImage?, owner: UUID,originator: UUID) {
        
        // The name, owner and originator must not be empty
        guard !name.isEmpty  && !owner.uuidString.isEmpty && !originator.uuidString.isEmpty else {
            return nil
        }
        
        //The progress must between 0.0 and 1.0
        guard (progress >= 0) && (progress <= 1.0) else {
            return nil
        }
        
        self.reportName = name
        self.reportDesc = desc
        self.reportProgress = progress
        self.reportImage = photo
        self.reportOwner = owner
        self.reportOriginator = originator
    }
}
