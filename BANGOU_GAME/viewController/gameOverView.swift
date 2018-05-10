//
//  gameOverView.swift
//  BANGOU_GAME
//
//  Created by mac on 12/19/17.
//  Copyright © 2017 pc. All rights reserved.
//

import UIKit
import AVFoundation

enum Colors
{
    
    static let red = UIColor(red: 1.0, green: 0.0, blue: 77.0/255.0, alpha: 1.0)
    static let blue = UIColor(red: 127.0/255.0, green: 208.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        static let green = UIColor.green
//    static let green = UIColor(red: 35.0/255.0 , green: 233/255, blue: 173/255.0, alpha: 1.0)
    static let yellow = UIColor(red: 1, green: 209/255, blue: 77.0/255.0, alpha: 1.0)
    
}

enum Images
{
    
    static let box = UIImage(named: "Box")!
    static let triangle = UIImage(named: "Triangle")!
    static let circle = UIImage(named: "Circle")!
    static let swirl = UIImage(named: "Spiral")!
    
}


class gameOverView: UIViewController
{
    @IBOutlet var lbl_besttime: UILabel!
    var sTr_score = ""
    var sTr_time = ""
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
        print("game over time::-  ", sTr_time)
        print("game score::- ", sTr_score)
        
        lbl_time.text = sTr_time
        lbl_besttime.text = sTr_score
        
//        lbl_gamelevel.text = sTr_score
        
        btn_newgame.layer.cornerRadius = 10;
        
        
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
