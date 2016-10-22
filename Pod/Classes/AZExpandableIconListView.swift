//
//  AZExpandableIconListView.swift
//  Pods
//
//  Created by Chris Wu on 01/28/2016.
//  Copyright (c) 2016 Chris Wu. All rights reserved.
//

import Foundation


open class AZExpandableIconListView: UIView {
    
    fileprivate var icons:[UIImageView] = []
    fileprivate var scrollView:UIScrollView
    fileprivate var isSetupFinished : Bool = false
    fileprivate var isExpanded : Bool = false
    fileprivate var itemSpacingConstraints : [NSLayoutConstraint] = []
    
    open var imageSpacing:CGFloat = 4.0
    open var onExpanded: (()->())?
    open var onCollapsed:(()->())?
    
    /// Image width is set to be always 80% of container view's frame width
    fileprivate var imageWidth : CGFloat {
        return scrollView.frame.height * 0.8
    }
    
    fileprivate var halfImageWidth : CGFloat {
        return imageWidth * 0.5
    }
    
    fileprivate var stretchedImageWidth : CGFloat {
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
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(frame: frame)
        
        let onTapView = UITapGestureRecognizer(target: self, action: #selector(AZExpandableIconListView.onViewTapped))
        scrollView.addGestureRecognizer(onTapView)
        
        for image in images {
            let imageView = buildCircularIconFrom(image, containerFrame: frame)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            self.icons.append(imageView)
            scrollView.addSubview(imageView)
        }
        self.addSubview(scrollView)
        updateConstraints()
        updateContentSize()
    }
    
    func onViewTapped(){
        updateSpacingConstraints()
        isExpanded = !isExpanded
        updateContentSize()
        UIView.animate(withDuration: 0.4, delay: 0,
            usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3,
            options: UIViewAnimationOptions(), animations: { [weak self] in
                self?.layoutIfNeeded()
            }, completion: { [weak self] finished in
                if let weakself = self {
                    if weakself.isExpanded {
                        weakself.onExpanded?()
                    } else {
                        weakself.onCollapsed?()
                    }
                }
            })
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func updateConstraints() {
        super.updateConstraints()
        if isSetupFinished == false {
            setupInitialLayout()
        }
    }
    
    fileprivate func setupInitialLayout() {
        
        var layoutConstraints:[NSLayoutConstraint] = []
        
        for i in 0 ..< icons.count  {
            let currentView = icons[i]
            
            //UIImage's constraint to vertically centered to containing scrollview
            layoutConstraints.append(NSLayoutConstraint(item: currentView, attribute: NSLayoutAttribute.centerY, relatedBy: .equal, toItem: scrollView, attribute: .centerY, multiplier: 1, constant: 0))
            
            //UIImage's constraint for setting the width/height to be 80% of containing scrollview's height
            layoutConstraints.append(NSLayoutConstraint(item: currentView, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .height, multiplier: 0.8, constant: 0))
            layoutConstraints.append(NSLayoutConstraint(item: currentView, attribute: .height, relatedBy: .equal, toItem: scrollView, attribute: .height, multiplier: 0.8, constant: 0))
            
            if i == 0 {
                let marginLeftConstraint = NSLayoutConstraint(item: currentView,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: .equal,
                    toItem: scrollView,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1, constant: 0)
                
                layoutConstraints.append(marginLeftConstraint)
                
            } else {
                let previousView = icons[i-1]
                itemSpacingConstraints.append(NSLayoutConstraint(item: currentView,
                    attribute: .left,
                    relatedBy: .equal ,
                    toItem: previousView,
                    attribute: .centerX,
                    multiplier: 1,
                    constant: 1))
            }
        }
        
        layoutConstraints.append(contentsOf: itemSpacingConstraints)
        scrollView.addConstraints(layoutConstraints)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[container]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["container":scrollView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[container]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["container":scrollView]))
        
        isSetupFinished = true
        
    }
    
    /**
     Update the contraints of image spacing based on whether the images are expanded or not.
     Update content size of the containing UIScrollView.
     */
    fileprivate func updateSpacingConstraints(){
        if !isExpanded {
            for constraint in itemSpacingConstraints {
                constraint.constant = halfImageWidth + imageSpacing
            }
        } else {
            for constraint in itemSpacingConstraints {
                constraint.constant = 1
            }
        }
    }
    
    /**
     Update the content size of the containing UIScrollView based on whether the images are expanded or not.
     */
    fileprivate func updateContentSize(){
        if isExpanded {
            let width = stretchedImageWidth
            scrollView.contentSize = CGSize(width: width, height: self.frame.height)
        } else {
            let width = CGFloat(icons.count) * halfImageWidth
            scrollView.contentSize = CGSize(width: width, height: self.frame.height)
        }
    }
    
    /**
     Convert the passed in UIImage to a round UIImageView, plus add a white border around it.
     
     - parameter image: The icon
     - parameter frame: The container's frame of the image
     
     - returns: A circular UIImageView
     */
    fileprivate func buildCircularIconFrom(_ image:UIImage, containerFrame frame:CGRect) -> UIImageView {
        let newframe = CGRect(x: 0, y: 0, width: imageWidth, height: imageWidth)
        
        let imageView = UIImageView(frame:newframe)
        imageView.image = image
        
        let borderLayer = CALayer()
        let borderFrame = CGRect(x: -1, y: -1, width: newframe.width + 2, height: newframe.height + 2)
        
        borderLayer.backgroundColor = UIColor.clear.cgColor
        borderLayer.frame = borderFrame
        borderLayer.cornerRadius = newframe.width * 0.5
        borderLayer.borderWidth = 4.0
        borderLayer.borderColor = UIColor.white.cgColor
        borderLayer.masksToBounds = true
        
        imageView.layer.addSublayer(borderLayer)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = newframe.width * 0.5
        
        return imageView
    }
    
}
