//
//  hardGameOver_View.swift
//  BANGOU_GAME
//
//  Created by mac on 1/10/18.
//  Copyright © 2018 pc. All rights reserved.
//

import UIKit
import AVFoundation



//enum Colors
//{
//    
//    static let red = UIColor(red: 1.0, green: 0.0, blue: 77.0/255.0, alpha: 1.0)
//    static let blue = UIColor(red: 127.0/255.0, green: 208.0/255.0, blue: 250.0/255.0, alpha: 1.0)
//    static let green = UIColor.green
//    //    static let green = UIColor(red: 35.0/255.0 , green: 233/255, blue: 173/255.0, alpha: 1.0)
//    static let yellow = UIColor(red: 1, green: 209/255, blue: 77.0/255.0, alpha: 1.0)
//    
//}
//
//enum Images
//{
//    
//    static let box = UIImage(named: "Box")!
//    static let triangle = UIImage(named: "Triangle")!
//    static let circle = UIImage(named: "Circle")!
//    static let swirl = UIImage(named: "Spiral")!
//    
//}

class hardGameOver_View: UIViewController
{
    @IBOutlet var lbl_besttime: UILabel!
    var sTr_score = ""
    var sTr_score_time = ""
    @IBOutlet var lbl_time: UILabel!
    
    @IBOutlet var btn_newgame: UIButton!
    @IBOutlet var lbl_gamelevel: UILabel!
    
    var pianoSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Complete game", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
    
    var emitter = CAEmitterLayer()
    
    var colors:[UIColor] = [
        Colors.yellow,
        Colors.blue,
        Colors.green,
        Colors.red
    ]
    
    var images:[UIImage] = [
        Images.box,
        Images.triangle,
        Images.circle,
        Images.box
        //        Images.swirl
    ]
    
    var velocities:[Int] = [
        50,
        40,
        100,
        150
    ]
    
    override func viewDidLoad()
    {
        
        lbl_time.text = sTr_score
        
//        lbl_besttime.text = sTr_score
        
        //        lbl_gamelevel.text = sTr_score
        
        btn_newgame.layer.cornerRadius = 10;
        
        
        var arr_bestscor = [String]()
        
        var data: NSData? = nil
        data = UserDefaults.standard.object(forKey: "bestScor_hard") as? NSData
        
        if data == nil
        {
            
//            lbl_besttime.text =  "00"
            lbl_besttime.text = sTr_score
            
            arr_bestscor.append(sTr_score)
            
            UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: arr_bestscor), forKey: "bestScor_hard")
            
        }
            
        else
        {
            
           
            
        
            
            
            arr_bestscor = (NSKeyedUnarchiver.unarchiveObject(with: data! as Data) as! NSArray) as! [String]
            
            print("Best score: ",arr_bestscor)
            
             arr_bestscor.append(sTr_score)
            var a3 : Int = 0
            
            //            var a3 = Float(0)
            
            var a1 : Int
            var a2:Int
            
            var index_value = ""
            
            if arr_bestscor.count == 1
            {
                index_value = arr_bestscor[0]
            }
                
                
            else
            {
                
                for i in 0 ..< arr_bestscor.count-1
                {
                    
                    
                    //                    print("1st value",a1)
                    //                    print("2nd value",a2)
                    
                    if a3 == 0
                    {
                        a1 = Int(arr_bestscor[i])!
                        
                        a2 = Int(arr_bestscor[i+1])!
                        
                        if a1 > a2
                        {
                            a3 = a1
                            index_value = String(a3)
                            print("1value",index_value)
                            //                        index_value = arr_bestscor[i]
                        }
                        else
                        {
                            a3 = a2
                            index_value = String(a3)
                            print("1value",index_value)
                            //                        index_value = arr_bestscor[i+1]
                        }
                    }
                        
                    else
                    {
                        
                        a1 = a3
                        
                        a2 = Int(arr_bestscor[i+1])!
                        
                        
                        if a3 > a2
                        {
                            //                        a3 = a3
                            index_value = String(a3)
                            print("1value",index_value)
                            //                        index_value = arr_bestscor[i]
                        }
                            
                        else if a3 > a1
                        {
                            index_value = String(a3)
                            print("1value",index_value)
                            //                        index_value = arr_bestscor[i+1]
                        }
                        else if a1 > a2
                        {
                            a3 = a1
                            index_value = String(a1)
                            print("1value",index_value)
                            //                        index_value = arr_bestscor[i+1]
                        }
                        else if a2 > a1
                        {
                            a3 = a2
                            index_value = String(a2)
                            print("1value",index_value)
                            //                        index_value = arr_bestscor[i+1]
                        }
                            
                        else
                        {
                            index_value = String(a3)
                            print("1value",index_value)
                        }
                        
                    }
                    
                    
                }
                
            }
            
            print("1value",index_value)
            print(index_value)
            lbl_besttime.text =  index_value
            
            
            
                UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: arr_bestscor), forKey: "bestScor_hard")
            
            
            
        }
        
        
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func playBackgroundMusic()
    {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Complete game", ofType: "wav")!)
        
        //        print(aSound)
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer.prepareToPlay()
            
            //            audioPlayer.numberOfLoops = -1
            
            audioPlayer.play()
            
        }
            
        catch
        {
            print("Cannot play the file")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        audioPlayer.stop()
        
    }

    @IBAction func newGameClick(_ sender: Any)
    {
        let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectGameViewController") as! SelectGameViewController
        self.navigationController?.pushViewController(push, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        emitter.emitterPosition = CGPoint(x: self.view.frame.size.width / 2, y: -10)
        emitter.emitterShape = kCAEmitterLayerLine
        emitter.emitterSize = CGSize(width: self.view.frame.size.width, height: 2.0)
        emitter.emitterCells = generateEmitterCells()
        self.view.layer.addSublayer(emitter)
        
        
        playBackgroundMusic()
        
    }
    
    private func generateEmitterCells() -> [CAEmitterCell] {
        var cells:[CAEmitterCell] = [CAEmitterCell]()
        
        for index in 0..<8
        {
            
            let cell = CAEmitterCell()
            
            cell.birthRate = 2.0
            cell.lifetime = 8.0
            cell.lifetimeRange = 0
            cell.velocity = CGFloat(getRandomVelocity())
            cell.velocityRange = 0
            cell.emissionLongitude = CGFloat(Double.pi)
            cell.emissionRange = 0.5
            cell.spin = 3.5
            cell.spinRange = 0
            cell.color = getNextColor(i: index)
            cell.contents = getNextImage(i: index)
            cell.scaleRange = 0.15
            cell.scale = 0.2
            
            cells.append(cell)
            
        }
        
        return cells
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func getRandomVelocity() -> Int {
        return velocities[getRandomNumber()]
    }
    
    private func getRandomNumber() -> Int
    {
        return Int(arc4random_uniform(4))
    }
    
    private func getNextColor(i:Int) -> CGColor {
        if i <= 2 {
            return colors[0].cgColor
        } else if i <= 4 {
            return colors[1].cgColor
        } else if i <= 6 {
            return colors[2].cgColor
        } else {
            return colors[3].cgColor
        }
    }
    
    private func getNextImage(i:Int) -> CGImage {
        return images[i % 2].cgImage!
    }
    
}
