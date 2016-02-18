//
//  BusinessesViewController.swift
//  YelpClientApp
//
//  Created by Satoru Sasozaki on 2/18/16.
//  Copyright © 2016 Satoru Sasozaki. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController {

    var businesses: [Business]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })
    }
}
