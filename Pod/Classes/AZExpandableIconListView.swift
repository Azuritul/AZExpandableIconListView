//
//  AZExpandableIconListView.swift
//  Pods
//
//  Created by Chris Wu on 01/28/2016.
//  Copyright (c) 2016 Chris Wu. All rights reserved.
//

import Foundation


public class AZExpandableIconListView: UIView {
    
    private var icons:[UIImageView] = []
    private var scrollView:UIScrollView
    private var isSetupFinished : Bool = false
    private var isExpanded : Bool = false
    private var itemSpacingConstraints : [NSLayoutConstraint] = []
    
    var imageSpacing:CGFloat = 4.0
    
    /// Image width is set to be always 80% of container view's frame width
    private var imageWidth : CGFloat {
        return scrollView.frame.height * 0.8
    }
    
    private var halfImageWidth : CGFloat {
        return imageWidth * 0.5
    }
    
    private var stretchedImageWidth : CGFloat {
        return (CGFloat(icons.count) * imageWidth) + (CGFloat(icons.count) * imageSpacing)
    }
    
    /**
     Initializer
     
     - parameter frame:  The frame
     - parameter images: An array of images that are going to be displayed
     
     - returns: an AZExpandableIconListView
     */
    public init(frame: CGRect, images:[UIImage]) {
        
        scrollView = UIScrollView(frame: frame)
        scrollView.scrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(frame: frame)
        
        let onTapView = UITapGestureRecognizer(target: self, action: "onViewTapped")
        scrollView.addGestureRecognizer(onTapView)
        
        for image in images {
            let imageView = buildCircularIconFrom(image, containerFrame: frame)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            self.icons.append(imageView)
            scrollView.addSubview(imageView)
        }
        self.addSubview(scrollView)
        updateContentSize()
    }
    
    func onViewTapped(){
        updateSpacingConstraints()
        
        UIView.animateWithDuration(0.4, delay: 0,
            usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3,
            options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.layoutIfNeeded()
            }, completion: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func updateConstraints() {
        super.updateConstraints()
        if isSetupFinished == false {
            setupInitialLayout()
        }
    }
    
    private func setupInitialLayout() {
        
        var layoutConstraints:[NSLayoutConstraint] = []
        
        for i in 0 ..< icons.count  {
            let currentView = icons[i]
            
            //UIImage's constraint to vertically centered to containing scrollview
            layoutConstraints.append(NSLayoutConstraint(item: currentView, attribute: NSLayoutAttribute.CenterY, relatedBy: .Equal, toItem: scrollView, attribute: .CenterY, multiplier: 1, constant: 0))
            
            //UIImage's constraint for setting the width/height to be 80% of containing scrollview's height
            layoutConstraints.append(NSLayoutConstraint(item: currentView, attribute: .Width, relatedBy: .Equal, toItem: scrollView, attribute: .Height, multiplier: 0.8, constant: 0))
            layoutConstraints.append(NSLayoutConstraint(item: currentView, attribute: .Height, relatedBy: .Equal, toItem: scrollView, attribute: .Height, multiplier: 0.8, constant: 0))
            
            if i == 0 {
                let marginLeftConstraint = NSLayoutConstraint(item: currentView,
                    attribute: NSLayoutAttribute.Left,
                    relatedBy: .Equal,
                    toItem: scrollView,
                    attribute: NSLayoutAttribute.Left,
                    multiplier: 1, constant: 0)
                
                layoutConstraints.append(marginLeftConstraint)
                
            } else {
                let previousView = icons[i-1]
                itemSpacingConstraints.append(NSLayoutConstraint(item: currentView,
                    attribute: .Left,
                    relatedBy: .Equal ,
                    toItem: previousView,
                    attribute: .CenterX,
                    multiplier: 1,
                    constant: 1))
            }
        }
        
        layoutConstraints.appendContentsOf(itemSpacingConstraints)
        scrollView.addConstraints(layoutConstraints)
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[container]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["container":scrollView]))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[container]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["container":scrollView]))
        
        isSetupFinished = true
        
    }
    
    /**
     Update the contraints of image spacing based on whether the images are expanded or not.
     Update content size of the containing UIScrollView.
     */
    private func updateSpacingConstraints(){
        if !isExpanded {
            for constraint in itemSpacingConstraints {
                constraint.constant = halfImageWidth + imageSpacing
            }
        } else {
            for constraint in itemSpacingConstraints {
                constraint.constant = 1
            }
        }
        isExpanded = !isExpanded
        updateContentSize()
    }
    
    /**
     Update the content size of the containing UIScrollView based on whether the images are expanded or not.
     */
    private func updateContentSize(){
        if isExpanded {
            let width = stretchedImageWidth
            scrollView.contentSize = CGSizeMake(width, self.frame.height)
        } else {
            let width = CGFloat(icons.count) * halfImageWidth
            scrollView.contentSize = CGSizeMake(width, self.frame.height)
        }
    }
    
    /**
     Convert the passed in UIImage to a round UIImageView, plus add a white border around it.
     
     - parameter image: The icon
     - parameter frame: The container's frame of the image
     
     - returns: A circular UIImageView
     */
    private func buildCircularIconFrom(image:UIImage, containerFrame frame:CGRect) -> UIImageView {
        let newframe = CGRectMake(0, 0, imageWidth, imageWidth)
        
        let imageView = UIImageView(frame:newframe)
        imageView.image = image
        
        let borderLayer = CALayer()
        let borderFrame = CGRectMake(-1, -1, newframe.width + 2, newframe.height + 2)
        
        borderLayer.backgroundColor = UIColor.clearColor().CGColor
        borderLayer.frame = borderFrame
        borderLayer.cornerRadius = newframe.width * 0.5
        borderLayer.borderWidth = 4.0
        borderLayer.borderColor = UIColor.whiteColor().CGColor
        borderLayer.masksToBounds = true
        
        imageView.layer.addSublayer(borderLayer)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = newframe.width * 0.5
        
        return imageView
    }
    
}
