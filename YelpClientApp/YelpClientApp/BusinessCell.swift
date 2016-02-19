//
//  BusinessCell.swift
//  YelpClientApp
//
//  Created by Satoru Sasozaki on 2/19/16.
//  Copyright © 2016 Satoru Sasozaki. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    // UIComponents
    var nameLabel: UILabel?
    var thumbImageView: UIImageView?
    var ratingImageView: UIImageView?
    var addressLabel: UILabel?
    var categoriesLabel: UILabel?
    var distanceLabel: UILabel?
    var priceLabel: UILabel?
    var reviewsCountLabel: UILabel?
    
    var cellHeight: Int?
    
    var business: Business! {
        didSet {
            nameLabel?.text = business.name
            thumbImageView?.setImageWithURL(business.imageURL!)
            categoriesLabel?.text = business.categories
            addressLabel?.text = business.address
            reviewsCountLabel?.text = "\(business.reviewCount!) Reviews"
            ratingImageView?.setImageWithURL(business.ratingImageURL!)
            distanceLabel?.text = business.distance
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.yellowColor()
//        // Create Labels
//        // nameLabel
//        nameLabel = UILabel()
//        nameLabel!.translatesAutoresizingMaskIntoConstraints = false
//        self.contentView.addSubview(nameLabel!)
//        // categoriesLabel
//        categoriesLabel = UILabel()
//        categoriesLabel!.translatesAutoresizingMaskIntoConstraints = false
//        self.contentView.addSubview(categoriesLabel!)
//        // addressLabel
//        addressLabel = UILabel()
//        addressLabel!.translatesAutoresizingMaskIntoConstraints = false
//        self.contentView.addSubview(addressLabel!)
//        // reviewsCountLabel
//        reviewsCountLabel = UILabel()
//        reviewsCountLabel!.translatesAutoresizingMaskIntoConstraints = false
//        self.contentView.addSubview(reviewsCountLabel!)
//        // distanceLabel
        
        
        // create thumbImageView
        thumbImageView = UIImageView()
        thumbImageView?.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(thumbImageView!)

//        // create ratingImageView
//        ratingImageView = UIImageView()
//        ratingImageView?.translatesAutoresizingMaskIntoConstraints = false
//        self.contentView.addSubview(ratingImageView!)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func autoLayoutStaticComponents() {
        // thumbImageView
        self.contentView.addConstraints([
            NSLayoutConstraint(
                item: thumbImageView!,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.contentView,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1,
                constant: 7),
            NSLayoutConstraint(
                item: thumbImageView!,
                attribute: NSLayoutAttribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: nil,
                attribute: NSLayoutAttribute.Width,
                multiplier: 1,
                constant: 65),
            NSLayoutConstraint(
                item: thumbImageView!,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: nil,
                attribute: NSLayoutAttribute.Height,
                multiplier: 1,
                constant: 65),
            NSLayoutConstraint(
                item: thumbImageView!,
                attribute: NSLayoutAttribute.Left,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.contentView,
                attribute: NSLayoutAttribute.Left,
                multiplier: 1,
                constant: 8),
            NSLayoutConstraint(
                item: thumbImageView!,
                attribute: NSLayoutAttribute.Right,
                relatedBy: NSLayoutRelation.LessThanOrEqual,
                toItem: self.contentView,
                attribute: NSLayoutAttribute.Right,
                multiplier: 1,
                constant: -8),
            NSLayoutConstraint(
                item: thumbImageView!,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.LessThanOrEqual,
                toItem: self.contentView,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1,
                constant: -53)
            ]
        )
    }
    
    func autoLayoutDynamicComponents() {
        
    }
    
    func calculateCellHeight() {

        
    }
    
    // Get UILabel height from the size of a string
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
    
    
}


// - Class method to calculate cell height
// - ConfigureCell method with business as an argument