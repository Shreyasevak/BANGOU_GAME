//
//  help_View.swift
//  BANGOU_GAME
//
//  Created by mac on 1/31/18.
//  Copyright © 2018 pc. All rights reserved.
//

import UIKit

class help_View: UIViewController, UIScrollViewDelegate
{
    @IBOutlet var btn_pre: UIButton!
    @IBOutlet var scrollView: UIScrollView!

    @IBOutlet var img_scroll: UIImageView!
    
    var img_data = [String]()
    
    var arrimg = ["1.png", "2.png" , "3.png"]
    
    @IBOutlet var btn_next: UIButton!
//    var pageControl : UIPageControl = UIPageControl(frame: CGRect(x:50,y: 300, width:200, height:50))
    
    @IBOutlet var pageController: UIPageControl!
    
    var sTr_easy = ""
    
    override func viewDidLoad()
    {
        
        if sTr_easy == "Yes"
        {
             img_data = ["easy-1.png", "easy-2.png", "easy-3.png", "easy-4.png"]
        }
            
        else if sTr_easy == "No"
        {
            img_data = ["hard-1.png", "hard-2.png", "hard-3.png", "hard-4.png", "hard-5.png", "hard-6.png"]
        }
        
        
        scrollView.delegate = self
        generatePages()
        
        configurePageControl()
        
        pageController.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControlEvents.valueChanged)
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func configurePageControl()
    {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageController.numberOfPages = img_data.count
        self.pageController.currentPage = 0
        
        if pageController.currentPage == 0
        {
            btn_pre.setImage(UIImage(named: ""), for: .normal)
            btn_pre.setTitle("", for: UIControlState.normal)
        }
        else
        {
            btn_pre.setImage(UIImage(named: "pre.png"), for: .normal)
            btn_pre.setTitle("", for: UIControlState.normal)
        }

        
        
        //self.pageController.tintColor = UIColor.red
        //self.pageController.pageIndicatorTintColor = UIColor.white
        //self.pageController.currentPageIndicatorTintColor = UIColor.red
//        self.view.addSubview(pageControl)
        
    }
    
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> ()
    {
        let x = CGFloat(pageController.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
        
        if pageController.currentPage == 2
        {
            btn_next.setImage(UIImage(named: ""), for: .normal)
            btn_next.setTitle("Done", for: UIControlState.normal)
        }
        else
        {
            btn_next.setImage(UIImage(named: "next1.png"), for: .normal)
            btn_next.setTitle("", for: UIControlState.normal)
        }
        
        if pageController.currentPage == 0
        {
            btn_pre.setImage(UIImage(named: ""), for: .normal)
            btn_pre.setTitle("", for: UIControlState.normal)
        }
        else
        {
            btn_pre.setImage(UIImage(named: "pre.png"), for: .normal)
            btn_pre.setTitle("", for: UIControlState.normal)
        }

        
        
    }
    
    @IBAction func preClick(_ sender: Any)
    {
        if pageController.currentPage == 0
        {
            
        }
        else
        {
        print("Preee",pageController.currentPage - 1)
        
        let x = CGFloat(pageController.currentPage - 1) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
        
        let pageNumber = pageController.currentPage - 1
        pageController.currentPage = Int(pageNumber)
        }
        
        
        if pageController.currentPage == 2
        {
            btn_next.setImage(UIImage(named: ""), for: .normal)
            btn_next.setTitle("Done", for: UIControlState.normal)
        }
        else
        {
            btn_next.setImage(UIImage(named: "next1.png"), for: .normal)
            btn_next.setTitle("", for: UIControlState.normal)
        }
        
        if pageController.currentPage == 0
        {
            btn_pre.setImage(UIImage(named: ""), for: .normal)
            btn_pre.setTitle("", for: UIControlState.normal)
        }
        else
        {
            btn_pre.setImage(UIImage(named: "pre.png"), for: .normal)
            btn_pre.setTitle("", for: UIControlState.normal)
        }

    }
    
    @IBAction func nextClick(_ sender: Any)
    {
        if pageController.currentPage == 2
        {
            navigationController?.popViewController(animated: true)
        }
            
        else
        {
            
        print("Next",pageController.currentPage + 1)
        
        let x = CGFloat(pageController.currentPage + 1) * scrollView.frame.size.width
        
        print("Next x",x)
        
        scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
        
        let pageNumber = pageController.currentPage + 1
            
        pageController.currentPage = Int(pageNumber)
            
        }
        
        
        if pageController.currentPage == 2
        {
            btn_next.setImage(UIImage(named: ""), for: .normal)
            btn_next.setTitle("Done", for: UIControlState.normal)
        }
        else
        {
            btn_next.setImage(UIImage(named: "next1.png"), for: .normal)
            btn_next.setTitle("", for: UIControlState.normal)
        }
        
        if pageController.currentPage == 0
        {
            btn_pre.setImage(UIImage(named: ""), for: .normal)
            btn_pre.setTitle("", for: UIControlState.normal)
        }
            
        else
        {
            btn_pre.setImage(UIImage(named: "pre.png"), for: .normal)
            btn_pre.setTitle("", for: UIControlState.normal)
        }
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageController.currentPage = Int(pageNumber)
        
        if pageController.currentPage == 2
        {
            btn_next.setImage(UIImage(named: ""), for: .normal)
            btn_next.setTitle("Done", for: UIControlState.normal)
        }
            
        else
        {
            btn_next.setImage(UIImage(named: "next1.png"), for: .normal)
            btn_next.setTitle("", for: UIControlState.normal)
        }

        if pageController.currentPage == 0
        {
            btn_pre.setImage(UIImage(named: ""), for: .normal)
            btn_pre.setTitle("", for: UIControlState.normal)
        }
        else
        {
            btn_pre.setImage(UIImage(named: "pre.png"), for: .normal)
            btn_pre.setTitle("", for: UIControlState.normal)
        }

        
        
        
    }
    
    
    func generatePages()
    {
        for i in 0..<img_data.count
        {
            img_scroll = UIImageView(frame: CGRect(x: scrollView.frame.size.width * CGFloat(i), y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height - 5))
        
            scrollView.backgroundColor = UIColor.clear
            
            print(img_data[i])
            
            img_scroll.image = UIImage(named: img_data[i])
            
            
            
            scrollView.addSubview(img_scroll)
        }
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(img_data.count), height: scrollView.frame.size.height)
        
        
    }
    
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView)
//    {
//        // This will be called every time the user scrolls the scroll view with their finger
//        // so each time this is called, contentOffset should be different.
//        
//        print(self.scrollView.contentOffset.y)
//        
////        pageControl.currentPage = Int(pageNumber)
//        
//        var pageWidth: CGFloat = scrollView.frame.size.width
//        
////        page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
//        
//        //Additional workaround here.
//    }
  
//
//
//    func scrollingTimer()
//    {
//        // access the scroll view with the tag
//        let scrMain = view.viewWithTag(1) as? UIScrollView
//        // same way, access pagecontroll access
//        let pgCtr = view.viewWithTag(12) as? UIPageControl
//        // get the current offset ( which page is being displayed )
//        let contentOffset: CGFloat? = scrMain?.contentOffset.x
//        // calculate next page to display
//        let nextPage = Int(contentOffset! / (scrMain?.frame.size.width)!) + 1
//        // if page is not 10, display it
//        if nextPage != 3
//        {
//            scrMain?.scrollRectToVisible(CGRect(x: CGFloat((CGFloat(nextPage) * (scrMain?.frame.size.width)!)), y: 0, width: scrMain?.frame.size.width ?? 0.0, height: scrMain?.frame.size.height ?? 0.0), animated: true)
//            pgCtr?.currentPage = nextPage
//            // else start sliding form 1 :)
//        }
//        else {
//            scrMain?.scrollRectToVisible(CGRect(x: 0, y: 0, width: scrMain?.frame.size.width ?? 0.0, height: scrMain?.frame.size.height ?? 0.0), animated: true)
//            pgCtr?.currentPage = 0
//        }
//    }
    
    
    @IBAction func backClick(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
