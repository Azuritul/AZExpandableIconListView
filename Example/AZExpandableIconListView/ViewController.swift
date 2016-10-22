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
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = UIColor.white
        
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
        
        let expandable = AZExpandableIconListView(frame: CGRect(x: 4, y: 10, width: UIScreen.mainScreen().bounds.size.width - 20, height: 50), images: imageArray)
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
        
        let label = UILabel(frame: CGRect(x: 10, y: 40, width: 200, height: 100))
        label.text = "Initial"
        label.textColor = UIColor.gray
        textLabel = label
        textLabel?.font = UIFont(name: "Helvetica", size: 16)
        self.view.addSubview(textLabel!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

