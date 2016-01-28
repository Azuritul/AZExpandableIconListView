//
//  ViewController.swift
//  AZExpandableIconListView
//
//  Created by Chris Wu on 01/28/2016.
//  Copyright (c) 2016 Chris Wu. All rights reserved.
//

import UIKit
import AZExpandableIconListView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageArray : [UIImage] = [
            UIImage(named: "icon_1.jpg")!,
            UIImage(named: "icon_2.jpg")!,
            UIImage(named: "icon_3.jpg")!,
            UIImage(named: "icon_1.jpg")!,
            UIImage(named: "icon_2.jpg")!,
            UIImage(named: "icon_3.jpg")!,
            UIImage(named: "icon_1.jpg")!,
            UIImage(named: "icon_2.jpg")!,
            UIImage(named: "icon_3.jpg")!
        ]
        
        let expandable = AZExpandableIconListView(frame: CGRectMake(4, 30, UIScreen.mainScreen().bounds.size.width - 20, 70), images: imageArray)
        view.addSubview(expandable)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

