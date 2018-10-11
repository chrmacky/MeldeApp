//
//  ReportDetailTableViewController.swift
//  MeldeApp
//
//  Created by Christoph Lemke on 11.10.18.
//  Copyright © 2018 Christoph Lemke. All rights reserved.
//

import UIKit
import Foundation

class ReportDetailTableViewController: UITableViewController {

    //MARK: Properties
    var reportDetails = [ReportDetail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //load the sample Data of reports
        loadSampleData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reportDetails.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ReportDetailTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ReportDetailTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ReportDetailTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let report = reportDetails[indexPath.row]
        
        cell.reportName.text = report.reportName
        cell.reportProgress.progress = report.reportProgress
        cell.reportPhotoImageView.image = report.reportImage
        cell.reportOriginator.text = "nicht bearbeitbar"
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: private methods
    func loadSampleData(){
        let photo1 = UIImage(named: "report1")
        let photo2 = UIImage(named: "report2")
        let photo3 = UIImage(named: "report3")
        
       
        
        guard let report1 = ReportDetail(name: "Zahnrade rollt raus", desc: "Wenn die Maschine anspringt, geht sie sofort wieder in den Rugeschlaf und fängt von vorn an.", progress: 0.0, photo: photo1) else {
            fatalError("Unable to instantiate report1")
        }
        guard let report2 = ReportDetail(name: "Kaffe im Wasser", desc: "", progress: 0.4, photo: photo2) else {
            fatalError("Unable to instantiate report2")
        }
        guard let report3 = ReportDetail(name: "Maschine Pumpt kein Wasser ab", desc: "In der Trommel bleibt das gesamte Wasser stehen.", progress: 0.7, photo: photo3) else {
            fatalError("Unable to instantiate report3")
        }
        reportDetails += [report1, report2, report3]
        
    }
}
