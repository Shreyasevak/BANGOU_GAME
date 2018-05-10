//
//  Terms_View.swift
//  BANGOU_GAME
//
//  Created by mac on 3/10/18.
//  Copyright © 2018 pc. All rights reserved.
//

import UIKit

class Terms_View: UIViewController
{
    
    @IBOutlet var webview: UIWebView!

    var sTr_terms = ""
    
    
    
    
    override func viewDidLoad()
    {
        webview.isOpaque = false
        webview.backgroundColor = UIColor.clear
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        
        if sTr_terms == "Terms_View"
        {
            let url = URL (string: "http://mbdbtechnology.com/projects/bangou/ws/terms")
            let requestObj = URLRequest(url: url!)
            webview.loadRequest(requestObj)
        }
        
        
        if sTr_terms == "Privercy"
        {
            let url = URL (string: "http://mbdbtechnology.com/projects/bangou/ws/privacy")
            let requestObj = URLRequest(url: url!)
            webview.loadRequest(requestObj)
        }
        
        super.viewWillAppear(animated) // No need for semicolon
    }
    
    
    @IBAction func backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
