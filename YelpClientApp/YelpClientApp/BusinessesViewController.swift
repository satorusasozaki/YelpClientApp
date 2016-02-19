//
//  BusinessesViewController.swift
//  YelpClientApp
//
//  Created by Satoru Sasozaki on 2/18/16.
//  Copyright © 2016 Satoru Sasozaki. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var businesses: [Business]!
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure tableView
        tableView = UITableView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)), style: UITableViewStyle.Plain)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.registerClass(BusinessCell.self, forCellReuseIdentifier: "BusinessCell")
//        tableView?.rowHeight = UITableViewAutomaticDimension
//        tableView?.estimatedRowHeight = 120
        
        tableView?.rowHeight = 200
        self.view.addSubview(tableView!)
        
        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView?.reloadData()
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })
    }
    
    // MARK: TableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil {
            return businesses!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
        cell.business = businesses[indexPath.row]
        cell.autoLayoutStaticComponents()
        return cell
    }
}
