//
//  SelectGameViewController.swift
//  BANGOU_GAME
//
//  Created by pc on 10/31/17.
//  Copyright © 2017 pc. All rights reserved.
//

import UIKit
import AVFoundation
import StoreKit
//import RageProducts



class SelectGameViewController: UIViewController {
    
    @IBOutlet var btn_share: UIButton!
    @IBOutlet var btn_music: UIButton!
    
    var play:Bool = false
    var audioPlayer: AVAudioPlayer?
    var sTr_gameLevel = ""
    

    @IBOutlet var btn_extreme: UIButton!
    @IBOutlet var btn_easy: UIButton!
    @IBOutlet var btn_hard: UIButton!
    
    var sTr_how_play = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if sTr_how_play == "Yes"
        {
            btn_music.isHidden=true
            btn_share.isHidden=true
        }
        
//          playBackgroundMusic()

        btn_easy.layer.cornerRadius = 10;
        btn_hard.layer.cornerRadius = 10; // this value vary as per your desire
        
//        btn_extreme.layer.cornerRadius = 10;
        
        
        let sTr_sound = UserDefaults.standard.object(forKey: "music") as? String
        
        if sTr_sound == "on"
        {
             btn_music.setImage(UIImage(named: "sound"), for: .normal)
        }
            
        else
        {
            play = true
             btn_music.setImage(UIImage(named: "mute"), for: .normal)
        }
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
//        playBackgroundMusic()
        super.viewWillAppear(animated) // No need for semicolon
    }
    
    @IBAction func ExtremeClick(_ sender: Any)
    {
        audioPlayer?.stop()
        
        let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        push.sTr_level = "Extreme"
        self.navigationController?.pushViewController(push, animated: true)
       
//        sTr_gameLevel = "Extreme"
//        self.btn_extreme.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
//        
//        UIView.animate(withDuration: 2.0,
//                       delay: 0,
//                       usingSpringWithDamping: 0.2,
//                       initialSpringVelocity: 6.0,
//                       options: .allowUserInteraction,
//                       animations: { [weak self] in
//                        self?.btn_extreme.transform = .identity
//            },
//                       completion: nil)
//        
//        perform(#selector(getData), with: nil, afterDelay: 1.0)
        
    }
    
    var buyButtonHandler: ((_ product: SKProduct) -> ())?
    var product: SKProduct? {
        didSet {
            guard let product = product else { return }
            
//            textLabel?.text = product.localizedTitle
            
            if RageProducts.store.isProductPurchased(product.productIdentifier) {
//                accessoryType = .checkmark
//                accessoryView = nil
//                detailTextLabel?.text = ""
            }
            else if IAPHelper.canMakePayments()
            {
//                ProductCell.priceFormatter.locale = product.priceLocale
//                detailTextLabel?.text = ProductCell.priceFormatter.string(from: product.price)
//
//                accessoryType = .none
//                accessoryView = self.newBuyButton()
            } else {
//                detailTextLabel?.text = "Not available"
            }
        }
    }
    
    @IBAction func btn_for_hard(_ sender: UIButton)
    {
        
        //USer for In App purchse whenever user IAP that time uncomment this Two lines
//        RageProducts.store.restorePurchases()
//          buyButtonHandler?(product!)
        
        
        
//        audioPlayer?.stop()
        
        if sTr_how_play == "Yes"
        {
            let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "help_View") as! help_View
            push.sTr_easy = "No"
            self.navigationController?.pushViewController(push, animated: true)
        }
        else
        {

        let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        push.sTr_level = "hard"
        self.navigationController?.pushViewController(push, animated: true)

        }
        
        
 

        
    }
    
    @IBAction func backClick(_ sender: Any)
    {
        if sTr_how_play == "Yes"
        {
            self.navigationController?.popViewController(animated: true)
        }
            
        else
        {
            let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlayGameViewController") as! PlayGameViewController
        
            self.navigationController?.pushViewController(push, animated: true)
        }
    }
    
    
    @IBAction func btn_for_easy(_ sender: UIButton)
    {
        sTr_gameLevel = "easy"
        
//        audioPlayer?.stop()
        
//        UIView.animate(withDuration: 0.50, animations:
//        {
//            self.btn_easy.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
//        })

        
//        
//        UIView.animate(withDuration: 1, animations:
//            {
//            self.btn_easy.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//        })
//        {
//            (finished) in
//            UIView.animate(withDuration: 1, animations: {
//                self.btn_easy.transform = CGAffineTransform.identity
//            })
//        }

//        let originalTransform = self.btn_easy.transform
//        let scaledTransform = originalTransform.scaledBy(x: 0.2, y: 0.2)
//        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: 0.0, y: -250.0)
//        UIView.animate(withDuration: 0.7, animations:
//        {
//            self.btn_easy.transform = scaledAndTranslatedTransform
//        })
        
        
        
//        UIView.animate(withDuration: 1, animations: {
//            self.btn_easy.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//        }) { (finished) in
//            UIView.animate(withDuration: 1, animations: {
//                self.btn_easy.transform = CGAffineTransform.identity
//            })
//        }

        
        
        
//        self.btn_easy.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
//        
//        UIView.animate(withDuration: 2.0,
//                       delay: 0,
//                       usingSpringWithDamping: 0.2,
//                       initialSpringVelocity: 6.0,
//                       options: .allowUserInteraction,
//                       animations: { [weak self] in
//                        self?.btn_easy.transform = .identity
//            },
//                       completion: nil)
//        
//         perform(#selector(getData), with: nil, afterDelay: 1.0)
        
        if sTr_how_play == "Yes"
        {
        let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "help_View") as! help_View
                push.sTr_easy = "Yes"
        self.navigationController?.pushViewController(push, animated: true)
        }
        else
        {
            let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
            push.sTr_level = "easy"
            self.navigationController?.pushViewController(push, animated: true)
        }
        
        
    }
    
    func getData()
    {
       if sTr_gameLevel == "easy"
       {
        
        let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        push.sTr_level = sTr_gameLevel
        self.navigationController?.pushViewController(push, animated: true)
        
        }
       if sTr_gameLevel == "hard"
       {
        
        
            let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
            push.sTr_level = sTr_gameLevel
            self.navigationController?.pushViewController(push, animated: true)
        
        }
        
        if sTr_gameLevel == "Extreme"
        {
            let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
            push.sTr_level = sTr_gameLevel
            self.navigationController?.pushViewController(push, animated: true)
            
        }
    }
    
    @IBAction func btn_for_Share(_ sender: UIButton)
    {
        let message = "BANGOU_APP"
        //Set the link to share.
        if let link = NSURL(string: "https://marvelapp.com/42dcj2b/screen/33606755")
        {
            let objectsToShare = [message,link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList]
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func btn_for_music(_ sender: UIButton)
    {
         playBackgroundMusic()
    }
    
    func play_music()
    {
       
        if play == false
        {
            play = true
//            audioPlayer?.stop()
            
            btn_music.setImage(UIImage(named: "mute"), for: .normal)
            
            UserDefaults.standard.set("off", forKey: "music")

        }
            
        else
        {
                play = false
//                audioPlayer?.numberOfLoops = -1
//               audioPlayer?.play()
            
             btn_music.setImage(UIImage(named: "sound"), for: .normal)
            
            UserDefaults.standard.set("on", forKey: "music")
            
            
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    func playBackgroundMusic()
    {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "mario", ofType: "mp3")!)
//        print(aSound)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.prepareToPlay()
            play_music()

        } catch
        {
            print("Cannot play the file")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        play = true
        audioPlayer?.stop()
        
    }
    
    
}
