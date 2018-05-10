//
//  PlayGameViewController.swift
//  BANGOU_GAME
//
//  Created by pc on 10/31/17.
//  Copyright © 2017 pc. All rights reserved.
//

import UIKit
import AVFoundation

class PlayGameViewController: UIViewController
{

    var play:Bool = false
    var audioPlayer: AVAudioPlayer?
    
    @IBOutlet var btn_share: UIButton!
    @IBOutlet var btn_music: UIButton!
    @IBOutlet var btn_play: UIButton!
    @IBOutlet var btn_rate: UIButton!
    @IBOutlet var btn_help: UIButton!
    @IBOutlet var btn_more: UIButton!
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        btn_play.layer.cornerRadius = 10; // this value vary as per your desire
        btn_help.layer.cornerRadius = 10; // this value vary as per your desire
        btn_rate.layer.cornerRadius = 10; // this value vary as per your desire
        btn_more.layer.cornerRadius = 10;
        
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
    
    @IBAction func moreClick(_ sender: Any)
    {
        play = true
        audioPlayer?.stop()
        
        let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "more_View") as! more_View
        self.navigationController?.pushViewController(push, animated: true)

    }
    
    @IBAction func playClick(_ sender: Any)
    {
        play = true
        audioPlayer?.stop()
        let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectGameViewController") as! SelectGameViewController
        self.navigationController?.pushViewController(push, animated: true)
    }
    
    @IBAction func helpClick(_ sender: Any)
    {
        play = true
        audioPlayer?.stop()
        
        let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectGameViewController") as! SelectGameViewController
        push.sTr_how_play = "Yes"
        self.navigationController?.pushViewController(push, animated: true)
    }
    
    @IBAction func rateClick(_ sender: Any)
    {
        
        UIApplication.shared.openURL(NSURL(string: "itms://itunes.apple.com/de/app/x-gift/id1185320272?mt=8&uo=4")! as URL)
        
        
        //        UIApplication.shared.openURL(NSURL(string : "itms-apps://itunes.apple.com/app/1212121")! as URL)
        
        //        itms-apps://itunes.apple.com/app/996848141
        
        //        itms-apps://itunes.apple.com/us/app/apple-store/YOUR_APP_ID?mt=8
        
        


//        if let reviewURL = URL(string: "itms-apps://itunes.apple.com/us/app/apple-store/1185320272?mt=8"), UIApplication.shared.canOpenURL(reviewURL) {
//            if #available(iOS 10.0, *)
//            {
//                UIApplication.shared.open(reviewURL, options: [:], completionHandler: nil)
//            }
//            else
//            {
//                UIApplication.shared.openURL(reviewURL)
//            }     
//        }
//        
        
        
//        let url = URL(string: "itms-apps://itunes.apple.com/app/id\("1185320272")")!
//        UIApplication.shared.openURL(url)
        
        //Workinggggg
        
//        var buyString = "http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=1185320272&mt=8"
//        var url = URL(string: buyString)
//        UIApplication.shared.openURL(url!)
        
////////////
        
        
        
        
        
        
//        var fdAppUrl = "itms://itunes.apple.com/us/app/apple-store/996848141?mt=8"
//        UIApplication.shared.openURL(URL(string: fdAppUrl)!)
        
        
        
        
//        if let checkURL = NSURL(string: "itms-apps://itunes.apple.com/us/app/apple-store/1185320272?mt=8")
//        {
//            if UIApplication.shared.openURL(checkURL as URL)
//            {
//                print("url sucefully opened")
//            }
//
//        }
//            
//        else
//        {
//            print("invalid url")
//        }
        

        
        
    }
    
    
    
    
  
//    func rateApp(appId: String, completion: @escaping ((_ success: Bool)->())) {
//        guard let url = URL(string : "itms-apps://itunes.apple.com/app/" + appId) else {
//            completion(false)
//            return
//        }
//        guard #available(iOS 10, *) else {
//            completion(UIApplication.shared.openURL(url))
//            return
//        }
//        UIApplication.shared.open(url, options: [:], completionHandler: completion)
//    }
    
    
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
//            audioPlayer?.pause()
            
//            btn.setImage(UIImage(named: "play.png"), for: .normal)
            btn_music.setImage(UIImage(named: "mute"), for: .normal)
            
            UserDefaults.standard.set("off", forKey: "music")
            
        }
        else
        {
            play = false
            
//            audioPlayer?.numberOfLoops = -1
//            audioPlayer?.play()
            
            btn_music.setImage(UIImage(named: "sound"), for: .normal)
            
            UserDefaults.standard.set("on", forKey: "music")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Sound play from here
    func playBackgroundMusic()
    {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "mario", ofType: "mp3")!)
//        print(aSound)
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.prepareToPlay()
            play_music()
            
        }
            
        catch
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



