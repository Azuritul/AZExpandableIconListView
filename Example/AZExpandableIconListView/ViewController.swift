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

    var textLabel:UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "AZExpandableIconListView"
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.view.backgroundColor = UIColor.whiteColor()
        
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
        
        let expandable = AZExpandableIconListView(frame: CGRectMake(4, 10, UIScreen.mainScreen().bounds.size.width - 20, 70), images: imageArray)
        expandable.onExpanded = {
            if let textLabel = self.textLabel {
                textLabel.text = "Expanded"
            }
        }
        
        expandable.onCollapsed = {
            if let textLabel = self.textLabel {
                textLabel.text = "Collapsed"
            }
        }
        self.view.addSubview(expandable)
        
        let label = UILabel(frame: CGRectMake(10, 40, 200, 100))
        label.text = "Initial"
        label.textColor = UIColor.grayColor()
        textLabel = label
        textLabel?.font = UIFont(name: "Helvetica", size: 16)
        self.view.addSubview(textLabel!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

