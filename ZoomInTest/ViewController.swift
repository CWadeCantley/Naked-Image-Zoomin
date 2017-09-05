//
//  ViewController.swift
//  ZoomInTest
//
//  Created by Chris Cantley on 8/24/17.
//  Copyright © 2017 Chris Cantley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



    
    @IBOutlet weak var smallViewContainer: UIView!
    @IBOutlet weak var smallImg: UIImageView!

    @IBOutlet weak var largeViewContainer: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var largeImageView: UIImageView!

    
    
    @IBAction func btnBackOnTap(_ sender: Any) {
        backTapped()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.scrollView.minimumZoomScale = 1
        self.scrollView.maximumZoomScale = 5.0
        self.scrollView.zoomScale = 1
        
        //Setup Image Tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.smallImageTapped))
        smallImg.addGestureRecognizer(tap)
        smallImg.isUserInteractionEnabled = true
        
        //Show the initial view
        largeViewContainer.isHidden = true
        smallViewContainer.isHidden = false
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backTapped(){
        
        
        //triggered by the "back" button, this adds animation to the view to un-scale the image to its original possition.
        self.scrollView.minimumZoomScale = 1.0
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0, options: .curveLinear, animations: {
                        
            self.scrollView.zoomScale = 1
            //self.largeViewContainer.alpha = 0
                        
        }, completion: {
            (isCompleted: Bool) in
            
            print(isCompleted)
            self.largeViewContainer.isHidden = true
            self.smallViewContainer.isHidden = false
            self.largeViewContainer.alpha = 1
            self.scrollView.zoomScale = 1
            
        })

    }
    
    
    func smallImageTapped () {
        
        //triggers the change of views and animates the zoom scale of the image.
        
        //fill with image and resize
        print("\(self.scrollView.zoomScale)")
        
        let getImage = UIImage(named: "homeImage")!
        self.largeImageView.image = getImage
        
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                        
            self.scrollView.zoomScale = 3.0
                        
        }, completion: {
            (isCompleted: Bool) in
            self.scrollView.minimumZoomScale = 3.0
        })

        largeViewContainer.isHidden = false
        smallViewContainer.isHidden = true
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    
}


