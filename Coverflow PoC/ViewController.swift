//
//  ViewController.swift
//  Coverflow PoC
//
//  Created by Omonayajo Oladapo Adeola on 06/06/2016.
//  Copyright © 2016 Prometheus Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
    
    @IBOutlet var carousel: iCarousel!
    var items:[Int] = []
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        for i in 0...99
        {
            items.append(i)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carousel.type = .Rotary
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        print(items.count)
        return items.count
    }
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        
        print("Called...")
        
        var label: UILabel
        var itemView: UIImageView
        
        //create new view if no view is available for recycling
        if (view == nil)
        {
            //don't do anything specific to the index within
            //this `if (view == nil) {...}` statement because the view will be
            //recycled and used with other index values later
            itemView = UIImageView(frame:CGRect(x:0, y:0, width:200, height:400))
            itemView.image = UIImage(named: "page.png")
            itemView.contentMode = .Center
            
            label = UILabel(frame:itemView.bounds)
            label.backgroundColor = UIColor.clearColor()
            label.textAlignment = .Center
            label.font = label.font.fontWithSize(50)
            label.tag = 1
            itemView.addSubview(label)
        } else {
            //get a reference to the label in the recycled view
            itemView = view as! UIImageView;
            label = itemView.viewWithTag(1) as! UILabel!
        }
        
        //set item label
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
        label.text = "\(items[index])"
        
        return itemView
        
    }
    
    func carousel(carousel: iCarousel, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        
        if (option == .Spacing)
        {
            return value * 1.1
        }
        return value
        
    }

}

