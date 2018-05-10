//
//  more_View.swift
//  BANGOU_GAME
//
//  Created by mac on 3/10/18.
//  Copyright © 2018 pc. All rights reserved.
//

import UIKit
import MessageUI

class more_View: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet var btn_static: UIButton!
    @IBOutlet var btn_feedback: UIButton!
    @IBOutlet var btn_term: UIButton!
    
    @IBOutlet var btn_privercy: UIButton!
    
    
    override func viewDidLoad()
    {
        
        btn_static.isHidden = true
        btn_term.layer.cornerRadius = 10;
        btn_static.layer.cornerRadius = 10;
        btn_feedback.layer.cornerRadius = 10;
        btn_privercy.layer.cornerRadius = 10;
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func feedbackClick(_ sender: Any)
    {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
//        mailComposerVC.setToRecipients(["shreya@mxicoders.com"])
        mailComposerVC.setToRecipients(["info@bgraded.com"])
        mailComposerVC.setSubject("Bangou")
        mailComposerVC.setMessageBody("Hello,", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert()
    {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func statesticClick(_ sender: Any)
    {
        let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "one_statastic_View") as! one_statastic_View
        
        self.navigationController?.pushViewController(push, animated: true)

    }

    @IBAction func privercyClick(_ sender: Any)
    {
        let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Terms_View") as! Terms_View
        push.sTr_terms = "Privercy"
        self.navigationController?.pushViewController(push, animated: true)
    }
    
    
    @IBAction func termsClick(_ sender: Any)
    {
        let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Terms_View") as! Terms_View
        push.sTr_terms = "Terms_View"
        self.navigationController?.pushViewController(push, animated: true)
    }
    
    @IBAction func backClick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
